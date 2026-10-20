<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_settings_model extends CI_Model
{
    private $defaults = array(
        'background_type' => 'default',
        'background_color' => '#172b4d',
        'background_image' => '',
        'logo' => 'assets/djadol.png',
    );

    public function get_settings()
    {
        $settings = $this->defaults;
        $names = array();
        foreach ($settings as $key => $value) {
            $names[] = 'login_'.$key;
        }
        $rows = $this->db->where_in('config_name', $names)->get('m_config')->result();
        foreach ($rows as $row) {
            $settings[substr($row->config_name, 6)] = $row->config_value;
        }

        if (!in_array($settings['background_type'], array('default', 'color', 'image'), true)) {
            $settings['background_type'] = 'default';
        }
        if (!is_string($settings['background_color']) || !preg_match('/^#[0-9a-fA-F]{6}$/D', $settings['background_color'])) {
            $settings['background_color'] = $this->defaults['background_color'];
        }
        foreach (array('background_image', 'logo') as $key) {
            $path = $settings[$key];
            if (!$this->is_uploaded_image($path) || !is_file(FCPATH.$path)) {
                $settings[$key] = $this->defaults[$key];
            }
        }
        if ($settings['background_type'] === 'image' && $settings['background_image'] === '') {
            $settings['background_type'] = 'default';
        }
        return $settings;
    }

    public function save_settings($settings)
    {
        foreach ($this->defaults as $key => $default) {
            $name = 'login_'.$key;
            $exists = $this->db->where('config_name', $name)->count_all_results('m_config');
            $data = array('config_value' => $settings[$key]);
            if ($exists) {
                $saved = $this->db->where('config_name', $name)->update('m_config', $data);
            } else {
                // Legacy m_config.config_id is not AUTO_INCREMENT.
                $saved = $this->db->query(
                    'INSERT INTO m_config (config_id, config_name, config_value) '.
                    'SELECT COALESCE(MAX(config_id), 0) + 1, ?, ? FROM m_config',
                    array($name, $settings[$key])
                );
            }
            if (!$saved) {
                return false;
            }
        }
        return true;
    }

    public function is_uploaded_image($path)
    {
        return is_string($path) && preg_match('#^uploads/login/[a-f0-9]{32}\.(jpg|jpeg|png|gif)$#D', $path);
    }
}
