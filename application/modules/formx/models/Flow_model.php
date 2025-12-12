<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Flow_model extends Formx_model {
  public function get_limit_data_flow($limit, $start,$flow) {
      $user = $this->data['user'];

      $form_id=$this->input->post('form_id');
      $form_param = $this->get_param_datatable($form_id);
      $form_filter = $this->get_filter($form_id);

      $order            = $this->input->post('order');
      $dataorder = array();
      $where = array();

      $i=0;
      $dataorder[$i++] = $this->primary_key;
      foreach ($form_param->result() as $value) {
        $dataorder[$i++] = $value->column_name;
      }

      foreach ($form_param->result() as $p) {
          if ($p->type == 'upload') {
              continue;
          }
          if ($p->type == 'int' || $p->type == 'date') {
              if(!empty($this->input->post($p->column_name.'_min'))){
                  $where[$p->column_name.' >='] = $this->input->post($p->column_name.'_min');
              }
              if(!empty($this->input->post($p->column_name.'_max'))){
                  $where[$p->column_name.' <='] = $this->input->post($p->column_name.'_max');
              }
          }
          elseif ($p->type == 'select_ajax' || $p->type == 'select') {
              if(!empty($this->input->post($p->column_name))){
                  $where[$p->column_name] = $this->input->post($p->column_name);
              }
          }
          else{
            if(!empty($this->input->post($p->column_name))){
                $where["LOWER($p->column_name) LIKE"] = '%'.strtolower($this->input->post($p->column_name)).'%';
            }
          }
      }
      if(!empty($this->input->post('level_no'))){
        $where['t_flow.level_no'] = $this->input->post('level_no');
      }
      if ($this->input->post('parent_id')) {
          $where[$this->input->post('parent_column')] = $this->input->post('parent_id');
      }

      $where_user_owner='(t_flow.created_by = '.$user->id
      .' or m_flow_level.usergroup_id = '.$user->usergroup_id
      .' or t_flow.to_user = '.$user->id
      .')';



      $this->db->where($where);

      if(!($this->findUsergroup($user->usergroup_id,$flow->usergroup_view_all) || $user->usergroup_id == ROLE_ADMIN)){
        $this->db->where($where_user_owner);
      }
      
      $this->db->join('t_flow', 't_flow.id = '.$this->table.'.t_flow_id');
      $this->db->join('m_flow_level', 'm_flow_level.flow_id = t_flow.flow_id AND m_flow_level.level_no = t_flow.level_no');
      $result['total_rows'] = $this->count_rows();
      
      
      $this->db->select(
          $this->table.'.*
          ,t_flow.to_user
          ,t_flow.flow_id
          ,t_flow.level_no
          ,t_flow.created_by
          ,m_flow_level.usergroup_id
          ,m_flow_level.level_name
          ,m_flow_level.is_approve_leader
        ');
      $this->db->where($where);
      if(!($this->findUsergroup($user->usergroup_id,$flow->usergroup_view_all) || $user->usergroup_id == ROLE_ADMIN)){
        $this->db->where($where_user_owner);
      }
      
      if ($order) {
        $this->db->order_by( $this->table.'.'.$dataorder[$order[0]["column"]],  $order[0]["dir"]);
      }
      $this->db->limit($start, $limit);
      $this->db->join('t_flow', 't_flow.id = '.$this->table.'.t_flow_id');
      $this->db->join('m_flow_level', 'm_flow_level.flow_id = t_flow.flow_id AND m_flow_level.level_no = t_flow.level_no');
      $result['get_db']=$this->db->get($this->table);
      return $result;
  }

  public function findUsergroup($usergroup,$usergroup_continer)
  {
    // var_dump($usergroup);die();
    // var_dump($usergroup_continer);die();
    $pieces = explode(",", $usergroup_continer);
    foreach ($pieces as $s) {
        if($s == $usergroup) return true;
    }
    return false;
  }
  
  public function getFlowLevelDropdown($flow_id)
  {
    $sql = " SELECT * FROM m_flow_level WHERE flow_id=$flow_id ORDER BY level_no ASC";
    $data_db = $this->db->query($sql);
    $options = array();
    foreach ($data_db->result() as $r) {
      $options[$r->level_no] = $r->level_no.'-'.$r->level_name;
    }
    return $options;
  }
}