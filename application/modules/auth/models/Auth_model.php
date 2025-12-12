<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Auth_model extends MY_Model
{

    public $table = 's_user';
    public $primary_key = 'id';
    public $label = 'full_name';
    public $fillable = array(); // If you want, you can set an array with the fields that can be filled by insert/update
    public $protected = array('id'); // ...Or you can set an array with the fields that cannot be filled by insert/update

    function __construct()
    {
        parent::__construct();
        $this->soft_deletes = TRUE;
    }

    function create_random_code($length = 8, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') {

        $str = '';
        $max = strlen($keyspace)-1;
        for ($i = 0; $i < $length; ++$i) {
            $str .= $keyspace[random_int(0, $max)];
        }
        return $str;

    }

    public function forgotten_password_check($code)
    {
        $w = array(
            'forgotten_password_code' => $code,
            'forgotten_password_time >' => time(),
            );
        return $this->get($w);

    }

    public function encrypt_password($pass)
    {
        return password_hash($pass, PASSWORD_BCRYPT);
    }

    public function check_password($pass,$encrypt_pass)
    {
        return password_verify($pass, $encrypt_pass);
    }

    public function forgot_password($email)
    {
        $w = array('email' => $email );
        $user=$this->get($w);

        $forgotten_password_code = $this->create_random_code(99);

        $data = array(
            'forgotten_password_code' => $forgotten_password_code,
            'forgotten_password_time' => strtotime('+1 hour'),
            );

        if($this->update($data,$user->id)){
            $data_email = array('code' =>  $forgotten_password_code);
            $mail_message = $this->load->view('auth/email/forgot_password', $data_email, TRUE);
            $subject_mail = 'Reset Password';
            $this->send_mail($user->email,$subject_mail,$mail_message);
            return true;
        }else{
            return false;
        }
    }

    public function send_mail($to,$subject,$message)
    {
        $this->load->library('email');

        $this->email->from('your@example.com', 'Your Name');
        $this->email->to($to);

        $this->email->subject($subject);
        $this->email->message($message);
        $this->email->send();
    }

}

/* End of file Users_model.php */
/* Location: ./application/models/Users_model.php */
/* Please DO NOT modify this information : */
/* http://harviacode.com */
