<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_tiket_masuk extends MY_Model
{

    public $table = 't_tiket_masuk';
    public $primary_key = 'id';
    public $label = 'jumlah_pengunjung';

    function __construct()
    {
        parent::__construct();
            $this->soft_deletes = FALSE;
            $this->timestamps = FALSE;
        
    }
    
    // get total rows
    function get_limit_data($limit, $start) {
        $order            = $this->input->post('order');
        $dataorder = array();
        $where = array();

        $i=1;
        $dataorder[$i++] = 'jumlah_pengunjung';
        $dataorder[$i++] = 'plat_no';
        $dataorder[$i++] = 'jenis_kendaraan';
        $dataorder[$i++] = 'nilai_cash_pembayaran';
        $dataorder[$i++] = 'nilai_tagihan';
        $dataorder[$i++] = 'nilai_cash_kembalian';
        $dataorder[$i++] = 'payment_method';
        $dataorder[$i++] = 'createdAt';
        if(!empty($this->input->post('jumlah_pengunjung'))){
            $where['LOWER(jumlah_pengunjung) LIKE'] = '%'.strtolower($this->input->post('jumlah_pengunjung')).'%';
        }
        if(!empty($this->input->post('plat_no'))){
            $where['LOWER(plat_no) LIKE'] = '%'.strtolower($this->input->post('plat_no')).'%';
        }
        if(!empty($this->input->post('jenis_kendaraan'))){
            $where['LOWER(jenis_kendaraan) LIKE'] = '%'.strtolower($this->input->post('jenis_kendaraan')).'%';
        }
        if(!empty($this->input->post('nilai_cash_pembayaran'))){
            $where['LOWER(nilai_cash_pembayaran) LIKE'] = '%'.strtolower($this->input->post('nilai_cash_pembayaran')).'%';
        }
        if(!empty($this->input->post('nilai_tagihan'))){
            $where['LOWER(nilai_tagihan) LIKE'] = '%'.strtolower($this->input->post('nilai_tagihan')).'%';
        }
        if(!empty($this->input->post('nilai_cash_kembalian'))){
            $where['LOWER(nilai_cash_kembalian) LIKE'] = '%'.strtolower($this->input->post('nilai_cash_kembalian')).'%';
        }
        if(!empty($this->input->post('payment_method'))){
            $where['LOWER(payment_method) LIKE'] = '%'.strtolower($this->input->post('payment_method')).'%';
        }
        if(!empty($this->input->post('createdAt_start'))){
            $where['createdAt >='] = $this->input->post('createdAt_start');
        }
        if(!empty($this->input->post('createdAt_end'))){
            $where['createdAt <='] = $this->input->post('createdAt_end');
        }

        $this->where($where);
        $result['total_rows'] = $this->count_rows();
        
        $this->where($where);
        if ($order) {
            $this->order_by( $dataorder[$order[0]["column"]],  $order[0]["dir"]);
        }
        $this->limit($start, $limit);
        $result['get_db']=$this->get_all();
        return $result;
    }

}

