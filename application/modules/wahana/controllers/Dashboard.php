<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function index()
    {
        $this->template('v_dashboard');
    }

}

/* End of file Dashboard */
/* Location: ./application/modules/wahana/controllers/Dashboard */
