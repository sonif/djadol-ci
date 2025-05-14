<style>
    .modal { overflow: auto !important; }
</style>
<?php 
    $modal_size = 'modal-lg';
    if (!empty($this->input->post('modal_size'))) {
        $modal_size =$this->input->post('modal_size');
    }
 ?>
<?php $modal_id_gen = uniqid(); ?>
 <!-- <div id="main_modal<?php echo $modal_id_gen; ?>" class="modal fade bs-modal-lg"> -->
    <div class="modal fade" id="main_modal<?php echo $modal_id_gen; ?>" role="dialog" aria-labelledby="modal-form" aria-hidden="true" >
    <!-- <form class="" action="<?php //echo $upload_url ?>" method="post" id="upload_form" enctype="multipart/form-data" > -->
        <div class="modal-dialog <?php echo $modal_size ?>">

            <!-- Modal content-->
            <div class="modal-content">
                <!-- <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><?php //echo $title ?></h4>
                </div> -->
                <div class="modal-body p-0">
                    <?php echo $page_content ?>
                </div>
                <!-- <div class="modal-footer"> -->
                    <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button> -->
                <!-- </div> -->
            </div>
        </div>
    <!-- </form> -->
</div>

<script type="text/javascript">
    //for select2 filter search problem
    // $(".select2-ajax").select2({
    //     dropdownParent: $("#main_modal<?php echo $modal_id_gen; ?>")
    //   });

    $('#main_modal<?php echo $modal_id_gen; ?>').modal({show:true});
    sonifjs.initAjax(); // init metronic core componets
    $.fn.modal.Constructor.prototype._enforceFocus = function() {};

    // myjs.init(); // init metronic core componets
</script>
