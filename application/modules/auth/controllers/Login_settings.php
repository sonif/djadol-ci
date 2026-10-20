<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_settings extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata('is_logged_in') || (int) $this->usergroup_id !== (int) ROLE_ADMIN) {
            show_error('Hanya administrator yang dapat mengatur tampilan login.', 403);
        }
        $this->load->model('auth/Login_settings_model', 'login_settings');
        $this->data['menu_kode'] = 'login_settings';
    }

    public function index()
    {
        if (!$this->session->userdata('login_settings_token')) {
            $this->session->set_userdata('login_settings_token', bin2hex(random_bytes(32)));
        }
        $this->load->helper('security');
        $this->template('auth/v_login_settings', array(
            'settings' => $this->login_settings->get_settings(),
            'settings_token' => $this->session->userdata('login_settings_token'),
        ));
    }

    public function save()
    {
        if ($this->input->method() !== 'post') {
            show_error('Gunakan metode POST.', 405);
        }
        $token = $this->input->post('settings_token');
        $expected = $this->session->userdata('login_settings_token');
        if (!is_string($token) || !is_string($expected) || !hash_equals($expected, $token)) {
            show_error('Sesi formulir tidak valid. Muat ulang halaman pengaturan.', 403);
        }

        $settings = $this->login_settings->get_settings();
        $type = $this->input->post('background_type');
        $color = $this->input->post('background_color');
        if (!in_array($type, array('default', 'color', 'image'), true)) {
            $this->finish(false, 'Pilih jenis background yang valid.');
        }
        if (!is_string($color) || !preg_match('/^#[0-9a-fA-F]{6}$/D', $color)) {
            $this->finish(false, 'Warna background harus berupa kode hex, misalnya #172b4d.');
        }
        $settings['background_type'] = $type;
        $settings['background_color'] = $color;
        if ($this->input->post('default_logo') === '1') {
            $settings['logo'] = 'assets/djadol.png';
        }

        $uploaded = array();
        foreach (array('background_image', 'logo') as $field) {
            // Only upload files that will actually be used by the selected options.
            if (($field === 'background_image' && $type !== 'image') ||
                ($field === 'logo' && $this->input->post('default_logo') === '1')) {
                continue;
            }
            if (!isset($_FILES[$field]) || $_FILES[$field]['error'] === UPLOAD_ERR_NO_FILE) {
                continue;
            }
            $result = $this->upload_image($field);
            if (isset($result['error'])) {
                $this->remove_uploads($uploaded);
                $this->finish(false, $result['error']);
            }
            $settings[$field] = $result['path'];
            $uploaded[] = $result['path'];
        }
        if ($type === 'image' && $settings['background_image'] === '') {
            $this->remove_uploads($uploaded);
            $this->finish(false, 'Upload gambar background terlebih dahulu.');
        }
        if (!$this->login_settings->save_settings($settings)) {
            // Keep uploaded files: some m_config installations use non-transactional MyISAM.
            $this->finish(false, 'Pengaturan belum tersimpan seluruhnya. Silakan coba simpan kembali.');
        }
        $this->finish(true, 'Tampilan login berhasil disimpan.');
    }

    private function upload_image($field)
    {
        $label = $field === 'logo' ? 'Logo' : 'Background';
        $directory = FCPATH.'uploads/login/';
        if (!is_dir($directory) && !mkdir($directory, 0755, true)) {
            return array('error' => 'Folder upload tidak dapat dibuat.');
        }
        $this->load->library('upload');
        $this->upload->initialize(array(
            'upload_path' => $directory,
            'allowed_types' => 'jpg|jpeg|png|gif',
            'max_size' => 4096,
            'max_width' => 6000,
            'max_height' => 6000,
            'encrypt_name' => true,
            'file_ext_tolower' => true,
            'detect_mime' => true,
        ));
        if (!$this->upload->do_upload($field)) {
            return array('error' => $label.': '.strip_tags($this->upload->display_errors('', '')));
        }
        $file = $this->upload->data();
        $info = @getimagesize($file['full_path']);
        if (!$info || !in_array($info[2], array(IMAGETYPE_JPEG, IMAGETYPE_PNG, IMAGETYPE_GIF), true)) {
            unlink($file['full_path']);
            return array('error' => $label.' harus berupa gambar JPG, PNG, atau GIF yang valid.');
        }
        return array('path' => 'uploads/login/'.$file['file_name']);
    }

    private function remove_uploads($paths)
    {
        foreach ($paths as $path) {
            if ($this->login_settings->is_uploaded_image($path) && is_file(FCPATH.$path)) {
                unlink(FCPATH.$path);
            }
        }
    }

    private function finish($success, $message)
    {
        $this->session->set_flashdata($success ? 'login_settings_success' : 'login_settings_error', $message);
        redirect('auth/login_settings');
        exit;
    }
}
