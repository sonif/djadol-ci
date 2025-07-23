<link href="<?php echo base_url('assets/js/plugins/jstree/dist/themes/default/style.min.css') ?>" rel="stylesheet" type="text/css" />
<script src="<?php echo base_url('assets/js/plugins/jstree/dist/jstree.min.js') ?>"></script>
<!-- <script src="<?php echo base_url('assets/js/plugins/jstree/dist/jstreetable.js') ?>"></script> -->


<div class="card shadow">
    <div class="card-header">
        <div class="row align-item-center">
            <div class="col-8"><div class="uppercase"><?php echo $form->form_name ?></div></div>
            <div class="col-4 text-right">
                
            </div>
        </div>
    </div>
    <div class="card-body">
        <div>
            <button data-url="<?php echo site_url('formx/formx/form/'.$form_id) ?>" data-id="div_modal_form_<?php echo $form_id?>" data-parent_column="" class="btn btn-info btn-sm openmodal">
                <i class="fa fa-edit"></i> Add parent
            </button>
        </div>
        <div id="tree_4" class="tree-demo"> </div>
        <!-- <div class="alert alert-info no-margin margin-top-10"> Not</div> -->
    </div>
</div>

<script>
	$("#tree_4").jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
                'url' : function (node) {
                  return '<?php echo site_url("formx/formx/data_tree") ?>';
                },
                'data' : function (node) {
                  return { 
                  	'parent' : node.id ,
                  	'form_id' : '<?php echo $form_id ?>' ,
                  };
                }
            }
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "state" : { "key" : "demo3" },
        "plugins" : [ "dnd", "state", "types" ],
    }).bind("move_node.jstree", function (e, data) {
        // data.rslt.o is a list of objects that were moved
        // Inspect data using your fav dev tools to see what the properties are
        console.log(data);
        var p = {};
		p.id       =data.node.id; 
		p.parent   =data.parent; 
		p.position =data.position; 
		p.form_id  ='<?php echo $form_id ?>'; 
        $.post('<?php echo site_url("formx/formx/update_tree_move") ?>', p, function(data, textStatus, xhr) {
        	/*optional stuff to do after success */
        });
    });
    $('body').on('click', '.tree-delete', function(e) {
        e.preventDefault();
        var url_del = $(this).data("url");
        var title = $(this).data('title');
        var id = $(this).data('id');

        swal(
            {
                title: "Delete "+title+ " ?",
                // text: "Hak Akses berhasil ditambahkan!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: 'btn-danger',
                // cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            },
            function(isConfirm) {
                if (isConfirm) {
                    $.post(url_del, {param1: 'value1'}, function(data, textStatus, xhr) {
                        if (data.success == true) { 
                        	$('#tree_4').jstree().delete_node([id]);
                        }else{
                            swal("Opps!", data.message, "warning");
                        }
                    });
                }
            }
        );
    });
</script>
