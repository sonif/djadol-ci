<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-title">
                <div class='caption font-green'>
                    <span class='caption-subject bold uppercase'>File </span>
                  </div>
            </div>
            <div class='portlet-body'>
                <?php foreach ($form_id_arr as $form_id){
                        $form = $this->M_form->get($form_id); 
                        $fields = $this->M_form_param->get_all(array('form_id'=>$form->id));
                        $data_row = $this->db
                                ->where(array('t_flow_id'=>$t_flow_id))
                                ->get($form->form_table);

                        if ($data_row->num_rows()>0) {
                            $row = $data_row->row();
                            foreach ($fields as $p) {
                                if ($p->type == 'img' || $p->type == 'upload'||$p->type == 'file') {
                                    if(!empty($row->{$p->column_name})){
                        
                ?>
                                <a href="<?php echo base_url($p->path_upload.$row->{$p->column_name}) ?>" class="btn blue" ><?php echo $p->column_name ?></a>
                <?php 
                                    } // field value exist
                                } //end if param
                            } //end field
                        } //end if data exist
                    } //end form
                ?>
            </div>
        </div>
    </div>
</div>
