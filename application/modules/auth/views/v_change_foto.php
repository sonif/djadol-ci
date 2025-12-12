<!-- Jcrop -->
<link href="<?php echo base_url(); ?>assets/global/plugins/jcrop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
<script src="<?php echo base_url(); ?>assets/global/plugins/jcrop/js/jquery.Jcrop.min.js" type="text/javascript"></script>


<style type="text/css">
/* Box Upload */
.box-upload {
    min-height: 350px;
    position: relative;
}
.box-upload .img-responsive {
    margin: 0 auto;
}
.box-upload.dragover {
    border: 3px dashed #CCC;
}
.box-upload.dragover * {
    opacity: 0.5;
}
.box-upload .box-upload-text {
    position: absolute;
    width: 100%;
    text-align: center;
    top: 50%;
    margin-top: -80px;
}
.box-upload .box-upload-text .glyphicon {
    display: block;
    font-size: 5em;
    margin-bottom: 25px;
}
.box-upload input[type="file"] {
    position: absolute;
    width: 100%;
    height: 100%;
    cursor: pointer;
    opacity: 0;
    top: 0;
    left: 0;
}
.box-upload .box-preview .jcrop-holder {
    margin: 0 auto;
}
.modal.modal-scroll {
    overflow-y: auto;
}

.box-upload .box-preview img{
    max-width:100%;
    max-height:100%;
}
</style>

<div id="ubah_foto_modal" >
<!-- Main content -->
<section class='content'>
  <div class='row'>
    <div class='col-md-12'>
      <div class='portlet light'>
        <div class='portlet-title'>
          <div class='caption font-green'>
            <span class='caption-subject bold uppercase'>Upload foto </span>
          </div>
        </div>
        <div class='portlet-body form'>
          <form action="<?php echo $action; ?>" method="post" id="input_form" class="" role="form" enctype="multipart/form-data" >
            <div class='form-body'>
                <div class="box-upload">
                    <div class="box-preview">
                        <?php //if ($photo): ?>

                        <img src="<?php //echo $photo; ?>" class="img-responsive" >
                        <?php //endif ?>
                    </div>
                    <div class="box-upload-text">
                        <span class="glyphicon glyphicon-camera"></span>
                        Klik atau drag dan drop foto di sini
                    </div>
                    <input type="hidden" name="x" />
                    <input type="hidden" name="y" />
                    <input type="hidden" name="w" />
                    <input type="hidden" name="h" />
                    <input type="file" name="cover_dokumen" accept="image/*" id="ubah_foto_file">
                </div>
            </div>
            <div class='form-actions right1'>
                <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                <button type='submit' class='btn green' name='mode' value='new' >Simpan</button>
            </div>
          </form>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->
</div>

<script type="text/javascript">

    var memberProfile = {
        init: function() {
            //load modal
            // Ubah foto profil
            $('#input_form').submit(function(e) {
                e.preventDefault();
                main.submitAjaxModal($(this));
            });

            // Remove dragover style on drop
            $('#ubah_foto_file').on('drop', function(e){
                $(this).parents('#ubah_foto_modal .box-upload').removeClass('dragover');
            });
            // Add dragover style
            $('#ubah_foto_file').on('dragover', function(e){
                $(this).parents('#ubah_foto_modal .box-upload').addClass('dragover');
            });
            // Remove dragover style on mouse leave
            $('#ubah_foto_modal .box-upload').on('mouseleave', function(e){
                $(this).removeClass('dragover');
            });
            window.addEventListener("dragover",function(e){
                e = e || event;
                e.preventDefault();
            }, false);
            window.addEventListener("drop",function(e){
                e = e || event;
                if ($(e.target).attr('type') != 'file') {
                    e.preventDefault();
                    toastr.error('Upload foto pada bagian drap & drop.');
                }
            }, false);

            // Preview image
            $('#ubah_foto_file').on('change', function(e){
                var files = e.target.files;
                if (files && files[0]) {
                    if ( ! files[0].type.match('image.*')) {
                        toastr.error('Pastikan file berupa gambar.');
                    } else {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('#ubah_foto_modal')
                                .find('.box-preview')
                                .html('<img src="'+ e.target.result + '" id="jcrop_target">');

                            // memberProfile.initJCrop();
                        }

                        reader.readAsDataURL(files[0]);
                    }
                }
            });
        },
        initJCrop: function() {
            var $jcropTarget = $('#jcrop_target');
            $jcropTarget.Jcrop(
            {
                boxWidth: 538,
                boxHeight: 538,
                setSelect: [200, 200, 100, 100 ],
                aspectRatio: 1/1,
                allowSelect : false,
                minSize: [200, 200],
                onSelect: function(c) {
                    $('input[name=x]').val(c.x);
                    $('input[name=y]').val(c.y);
                    $('input[name=w]').val(c.w);
                    $('input[name=h]').val(c.h);
                }
            }
            );
        },
    };

    $(function() {
        memberProfile.init();
    });
</script>
