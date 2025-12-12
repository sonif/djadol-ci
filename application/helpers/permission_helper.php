<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('cek_hak_akses'))
{
    function cek_hak_akses($usergroup_id = '', $menu_kode='')
    {
        $ci =& get_instance();
        $sql = "
        SELECT 
            akses_id 
        FROM s_akses
        LEFT JOIN s_menu ON s_akses.menu_id = s_menu.menu_id

        where
            usergroup_id = $usergroup_id and
            menu_kode = '$menu_kode' and
            akses_active = 'y'
        ";

        if($ci->db->query($sql)->num_rows() <= 0){
            // redirect(site_url('404_override'));
        }
    }
}

if ( ! function_exists('cek_hak_akses_formx'))
{
    function cek_hak_akses_formx($usergroup_id = '', $menu_kode='')
    {
        $ci =& get_instance();
        $ci->load->library('session');
        if (!empty($ci->input->post('flow_id'))) {
            $menu_kode = 'flow_'.$ci->input->post('flow_id');
        }
        elseif (!empty($ci->input->post('parent_form_id'))) {
            $menu_kode = 'form_'.$ci->input->post('parent_form_id');
        }
        cek_hak_akses($usergroup_id,$menu_kode);
    }
}

if ( ! function_exists('get_listakses'))
{
    function get_listakses($usergroup_id = '', $menu_kode='')
    {
        $ci =& get_instance();
        $ar_haklistakses = [];

        $sql = "
        SELECT akses_code 
        FROM s_akses
        LEFT JOIN s_menu ON s_akses.menu_id = s_menu.menu_id
        where
            usergroup_id = $usergroup_id and
            menu_kode = '$menu_kode' and
            akses_active = 'y'
        ";
        $q = $ci->db->query($sql);
        if ($q->num_rows() > 0) {
            $akses_code = $q->row()->akses_code;
            if(!$ar_haklistakses = json_decode($akses_code,true)){
                $ar_haklistakses = [];
            }
        }

        return $ar_haklistakses;
    }
}

if ( ! function_exists('get_listakses_formx'))
{
    function get_listakses_formx($usergroup_id = '', $menu_kode='')
    {
        $ci =& get_instance();
        $ci->load->library('session');
        if ($ci->input->post('authorize') == 'readonly') {
            return $ar_haklistakses = array('xread');
        }
        if (!empty($ci->input->post('flow_id'))) {
            $menu_kode = 'flow_'.$ci->input->post('flow_id');
            return $ar_haklistakses = array('xcreate','xupdate','xdelete');
        }
        // if (!empty($ci->input->post('parent_form_id'))) {
        //     $menu_kode = 'form_'.$ci->input->post('parent_form_id');
        // }
        return get_listakses($usergroup_id,$menu_kode);
    }
}

if ( ! function_exists('tree_menu'))
{
    function tree_menu($usergroup_id = '',$menu_kode='z')
    {
        $ci =& get_instance();
        // $usergroup_id = $this->session->userdata('usergroup_id');
        $sql = "
        SELECT s_menu.*,s_akses.*,(SELECT COUNT(*) FROM s_menu p WHERE p.menu_parent = s_menu.menu_id) as hasChild
            FROM s_menu
            JOIN s_akses ON ( 
                s_akses.menu_id = s_menu.menu_id 
                and usergroup_id = $usergroup_id
                and akses_active = 'y')
            WHERE menu_active = 'y'
            ORDER BY menu_order asc;
        ";
        $items = $ci->db->query($sql)->result_array();
        if (count($items) == 0) {
            return '';
        }
        

        $html ='';
        foreach ($items as $itemId => $item) {
            if($item['menu_parent'] == 0){

                $html .= '<li class="nav-item">';
                if($item['hasChild'] > 0){
                    $collapse = 'collapse';
                    $selected = '';
                    foreach ($items as $subitemId => $subitem) {
                        if($subitem['menu_parent'] == $item['menu_id']){
                            if (($subitem['menu_kode'] == $menu_kode && !empty($subitem['menu_kode']) )||uri_string() == $subitem['menu_url']){
                                $collapse = '';
                                $selected = 'active';
                                break;
                            }
                        }
                    }
                    $html .= '
                    <a class="nav-link '.$selected.'" href="#sidemenu'.$item['menu_id'].'" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fa fa-bars text-warning"></i> '.$item['menu_nama'].' </a>
                    <ul class="'.$collapse.' list-unstyled" id="sidemenu'.$item['menu_id'].'" >
                    ';
                    foreach ($items as $subitemId => $subitem) {
                        if($subitem['menu_parent'] == $item['menu_id']){
                            if (($subitem['menu_kode'] == $menu_kode&& !empty($subitem['menu_kode'])) ||uri_string() == $subitem['menu_url'])
                                $selected = 'active';
                            else
                                $selected = '';

                            $html .= '
                                <li class="nav-item  pl-3">
                                <a class="nav-link '.$selected.'" href="'.site_url($subitem['menu_url']).'">
                                    <i class="'.((empty($subitem['menu_icon']))?'fa fa-cog':$subitem['menu_icon']).' text-warning"></i> '.$subitem['menu_nama'].' </a>
                                </a>
                                </li>
                            ';
                        }
                    }
                    $html .= '</ul>';
                }else{
                    if ($item['menu_kode'] == $menu_kode)
                        $selected = 'active';
                    else
                        $selected = '';

                    $html .= '
                        <a class="nav-link '.$selected.'" href="'.site_url($item['menu_url']).'">
                        <i class="ni ni-tv-2 text-primary"></i>
                        <span class="nav-link-text">'.$item['menu_nama'].'</span>
                        </a>
                    ';
                }
                $html .= '</li>';
            }
        }
        return $html;
    }
}

if ( ! function_exists('flow_menu'))
{
    function flow_menu($usergroup_id,$menu_code)
    {
        $ci =& get_instance();
        // $usergroup_id = $this->session->userdata('usergroup_id');
        if($usergroup_id == ROLE_ADMIN){
            $sql = "SELECT * FROM m_flow WHERE active  = 1";
        }else{
            $sql = "SELECT * FROM m_flow WHERE active  = 1 AND ( usergroup_menu is NULL OR (FIND_IN_SET($usergroup_id, usergroup_menu) > 0))";
        }
        $items = $ci->db->query($sql)->result_array();
        if (count($items) == 0) {
            return '';
        }
        $html='';
        foreach ( $items as $item ){
            if ('flow_'.$item['id'] == $menu_code)
                $selected = 'active';
            else
                $selected = '';

            $html.='
            <li class="nav-item">
                <a class="nav-link '.$selected.'" href="'.site_url('formx/flow/table/'.$item['id']).'">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">'.$item['name'].'</span>
                </a>
            </li>';
        }

        return $html;
    }
}
