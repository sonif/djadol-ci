<?php
defined("BASEPATH") or exit("No direct script access allowed");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
class Auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("auth/Auth_model");
        $this->load->model("Api_keys_model");
        $this->load->library("form_validation");
    }

    function test()
    {
        $now = new DateTime();
        // $now->modify('+7 hours');
        $res["time1"] = date("Y-m-d H:i:s");
        $res["time2"] = date("Y-m-d H:i:s", strtotime("+7 hours"));
        $this->output
            ->set_content_type("application/json")
            ->set_output(json_encode($res));
    }

    public function login()
    {
        $res["success"] = false;
        $res["message"] = "Maaf, telah terjadi kesalahan.";

        $this->load->library("form_validation");
        $this->form_validation->set_rules(
            "username",
            "Username",
            "trim|required",
        ); //valid_email
        $this->form_validation->set_rules(
            "password",
            "Password",
            "trim|required",
        );

        if ($this->form_validation->run() == true) {
            $remember = $this->input->post("remember");
            $username = $this->input->post("username");
            $password = $this->input->post("password");
            $w = ["email" => $username];
            if ($user = $this->Auth_model->get($w)) {
                if (
                    $this->Auth_model->check_password(
                        $password,
                        $user->password,
                    )
                ) {
                    if ($user->active == 1) {
                        $token = hash("sha256", $username . microtime());

                        $data = ["user_id" => $user->id, "key" => $token];
                        // single device login
                        // $this->Api_keys_model->replace($data,array('user_id'=>$user->id));
                        // multi device login
                        $this->Api_keys_model->insert($data);

                        $res["token"] = $token;
                        $res["success"] = true;
                        $res["message"] = "Login success";
                        $res["user_id"] = $user->id;
                        $res["full_name"] = $user->full_name;
                    }
                } else {
                    $res["success"] = false;
                    $res["message"] = "Username dan password tidak sesuai";
                }
            } else {
                $res["success"] = false;
                $res["message"] = "Username tidak ditemukan";
            }
        } else {
            $res["field_error"] = $this->form_validation->error_array();
            $res["message"] = "Lengkapi form dengan benar";
        }

        $this->output
            ->set_content_type("application/json")
            ->set_output(json_encode($res));
    }
}

/* End of file Auth.php */
