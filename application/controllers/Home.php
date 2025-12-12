<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

      public function index()
      {
            $date_start = date('Y-m-d');
            $date_end = date('Y-m-d');

            $q = "SELECT COUNT(id) as jumlah_visitasi FROM jurnal_visitasi 
                  WHERE created_at BETWEEN '".$date_start."' AND '".$date_end."'";
            $v_data['jumlah_visitasi'] = $this->db->query($q)->row()->jumlah_visitasi;

            $q = "SELECT SUM(total_price) as totalsales FROM jurnal_agen  
                  WHERE created_at BETWEEN '".$date_start."' AND '".$date_end."'";
            $v_data['totalsales'] = $this->db->query($q)->row()->totalsales;

            $q = "SELECT COUNT(id) as totalproduct FROM t_product";
            $v_data['totalproduct'] = $this->db->query($q)->row()->totalproduct;

            $q = "SELECT COUNT(a.id) as jumlah_agen 
                        FROM s_user as a
                        WHERE a.usergroup_id = 4";
            $v_data['jumlah_agen'] = $this->db->query($q)->row()->jumlah_agen;

            $this->template('wahana/v_dashboard', $v_data);
      }
}