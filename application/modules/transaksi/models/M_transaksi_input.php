<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_transaksi_input extends MY_Model
{

    public $table = 't_transaksi';
    public $primary_key = 'transaksi_id';
    public $label = 'transaksi_year_issue';

    function __construct()
    {
        parent::__construct();
        $this->soft_deletes = FALSE;
        $this->timestamps = FALSE;        
    }

}
