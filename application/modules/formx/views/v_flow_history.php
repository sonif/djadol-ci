

<div id="catatan_perizinan" class="modal fade modal-scroll" tabindex="-1" data-replace="true" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">History</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
			</div>
			<div class="modal-body">
				<div class="timeline-content">

					<div class="card">
							<!-- <img class="card-img-top" src="../../assets/img/theme/img-1-1000x600.jpg" alt="Card image cap"> -->
							<div class="card-body">
								<h3 class="card-title text-primary text-uppercase">
									<div class="row">
										<div class="col-md-6">
											<span class="text-default">Created by : </span>
											<span class="text-info"><?php echo $t_flow->employee_name ?></span></div>
										<div class="col-md-6 text-right">
										<span class="text-default">Todo : <?php echo $flow_level->level_no.' - '.$flow_level->level_name ?></span>
										<?php //if($t_flow->level_no > 1): ?>
										<!-- <span class="text-info"><?php //echo $usergoup_action ?></span></div> -->
										<?php //endif ?>
									</div>
									
								</h3>
								
							</div>
						</div>

						<?php if ($history): ?>
							<?php foreach ($history as $row): ?>
							<?php 
								$w = array(
									'flow_id' => $row->flow_id, 
									'level_no' => $row->level_no, 
								);
								$level = $this->M_flow_level_model->get($w);
							 ?>
							 		<div class="card mt-2">
										<!-- <img class="card-img-top" src="../../assets/img/theme/img-1-1000x600.jpg" alt="Card image cap"> -->
										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<h3 class="card-title text-primary text-uppercase">
														<?php echo $row->from_level_no.' - '.$row->level_name ; ?> 
														<?php if($row->approval_status == 'ekposisi'): ?>
															<span class="badge badge-pill badge-success ml-4"><i class="fa fa-check"></i></span>
														<?php elseif($row->approval_status == 'disposisi'): ?>
															<span class="badge badge-pill badge-danger ml-4"><i class="fa fa-undo"></i></span>
														<?php endif ?>
													</h3>
												</div>
												<div class="col-md-6">
													<p class="card-text text-warning text-right"><?php echo tgl_indo($row->approval_date) ?></p>
												</div>
											</div>
											
											<p class="card-text"><?php echo $row->approval_catatan ?></p>
											<!-- <span class="btn btn-primary"></span> -->
										</div>
									</div>
	                        
							<?php endforeach ?>
						<?php endif ?>
				</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn">Tutup</button>
			</div>
		</div>
	</div>
</div>
<script>
	$("#catatan_perizinan").modal('show');
</script>
<?php 
	                                    		// $w = array(
	                                    		// 	'flow_id' => $row->flow_id,
	                                    		// 	'level_no' => $row->from_level_no,
	                                    		// 	 );
	                                    		// $flow_level = $this->M_flow_level_model->get($w);

	                                    		// $data_flow_level['form_read_arr'] = explode(',', $flow_level->form_id);
	                                    	 //  	$this->load->view('v_flow_tab_read',$data_flow_level,FALSE); 
                                    	  	?>