<link href="<?php echo base_url('assets/global/plugins/dropzone/dropzone.min.css') ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/global/plugins/dropzone/basic.min.css') ?>" rel="stylesheet" type="text/css" />

<div class="modal fade" id="modal_dropzone">
    <div class="modal-dialog modal-full">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Upload</h4>
            </div>
            <div class="modal-body">
                
                <div class="row">
                    <div class="col-md-12">
                        <div class='portlet box green'>
                            <div class='portlet-title'>
                              <div class='caption'>
                                <span class='caption-subject bold uppercase'>Drag drop file here </span>
                              </div>
                            </div>
                            <div class='portlet-body form'>
                                <form class="form-horizontal" id="add-product-form" action="#" method="post">
                                    <input type="hidden" name="dt" value="<?php echo $dt ?>">
                                    <div id="myDropzone" class="dropzone">
                                    </div> <!-- This is the dropzone element -->

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<?php 
    $dt_funct = str_replace('/', '_', $dt); 
 ?>

<script src="<?php echo base_url('assets/global/plugins/dropzone/dropzone.min.js') ?>" type="text/javascript"></script>

<script>
    $('#modal_dropzone').modal({show:true});
    
    var myDropzone = new Dropzone("div#myDropzone", 
                        {
                             url: "<?php echo site_url('dropzone/upload_action') ?>",
                             init: function() {
                                this.on("sending", function(file, xhr, formData){
                                        formData.append("dt", "<?php echo $dt ?>");
                                });
                            }
                        }
                    );
    $("#modal_dropzone").on("hidden.bs.modal", function () {
        dropzone_load_img_<?php echo $dt_funct ?>();
    });

</script>