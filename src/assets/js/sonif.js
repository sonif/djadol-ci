var main = {
    alertMessage: function(message,type,options) {
        if (type == 'success' ) {
            swal(
                {
                    title: message,
                    // text: "Hak Akses berhasil ditambahkan!",
                    type: "success",
                    // confirmButtonClass: "btn-success",
                    // confirmButtonText: "Success",
                    // closeOnConfirm: true,
                    timer:1000,
                },
                function() {
                    if (options.url) { //console.log(options);
                        if (options.url == 'reload') {
                            location.reload();
                        }else{
                            window.location.replace(options.url);
                        }
                    }else{
                        swal.close();
                    }
                }
            );

        }else{
            // toastr.error(message);
            swal(
                {
                    title: message,
                    // text: "Hak Akses berhasil ditambahkan!",
                    type: "error",
                    // confirmButtonClass: "btn-success",
                    // confirmButtonText: "Success",
                    // closeOnConfirm: true,
                    timer:1000,
                }
            );
        }
    },

    resetForm: function(formObj) {
        formObj.find('input[type=text], input[type=hidden], textarea, input[type=password]').val('');
    },

    submitAjaxModal: function(formObj,options={}) {
        $.blockUI();
        var btnObj = formObj.find('button[type=submit]');

        if(formObj.attr('enctype')=="multipart/form-data"){
            var formData = new FormData(formObj[0]);
            options['cache'] = false;
            options['contentType'] = false;
            options['processData'] = false;

            if ($('#fileUploadProgressTemplate').length == 0) {
                formObj.append('\
                <div id="fileUploadProgressTemplate" style="display:none">\
                    <div class="progress progress-striped active">\
                        <div class="progress-bar progress-bar-info" style="width: 0%;"></div>\
                    </div>\
                </div>\
                ');
            }
            $("#fileUploadProgressTemplate").find(".progress-bar").width( 0 + "%");
            $("#fileUploadProgressTemplate").show();
            options['xhr'] = function() {
                var xhr = $.ajaxSettings.xhr();
                if (xhr.upload) {
                    xhr.upload.addEventListener('progress', function(evt) {
                        var percent = (evt.loaded / evt.total) * 100;
                        $("#fileUploadProgressTemplate").find(".progress-bar").width(percent + "%");
                    }, false);
                }
                return xhr;
            };
        }else{
            var formData = formObj.serialize();
        }
        $(".editor").each(function() {
            // console.log($(this));
            formData += "&"+$(this).attr('name')+"="+ encodeURIComponent($(this).summernote('code'));
        });

        $(".help-block-error" , formObj).remove();
        $(".form-group" , formObj).removeClass('has-error');
        // default settings
        options = $.extend(true, {
            url: formObj.attr('action'),
            dataType: "json",
            data: formData,
            type: "post",
            headers: {"authorization": localStorage.getItem('tokenApp')},

            beforeSend: function (e) {
                btnObj.button('loading');
            },
            success: function(response) {
                // console.log(response);
                if (response.success == true) {
                    // if (response.token) {
                    //     localStorage.setItem('tokenApp', response.token);
                    // }

                    if (response.reset == true) {
                        main.resetForm(formObj);
                    }
                    // if (typeof options._dataTable !== 'undefined') {
                    //     options._dataTable.getDataTable().ajax.reload();
                    // }
                    //execute function dengan pengembalian parameter
                    if (options.f_response) {
                        var fnstring = options.f_response;
                        // find object
                        var fn = window[fnstring];
                        // is object a function?
                        if (typeof fn === "function") fn(response,formObj);
                    }
                    // execute function tanpa respone
                    if (options.f_success) {
                        var fnstring = options.f_success;
                        // find object
                        var fn = window[fnstring];
                        // is object a function?
                        if (typeof fn === "function") fn();
                    }
                    if (response.datatable) {
                        $('#'+response.datatable).DataTable().ajax.reload();
                    }
                    if (typeof datatableAjax != "undefined" && datatableAjax) {
                        datatableAjax.getDataTable().ajax.reload();
                    }
                    // console.log(formObj);
                    // if (response.keepmodal != true) 
                        formObj.parents('.modal').modal('hide');
                    main.alertMessage(response.message,"success",response);
                } else {
                    if (response.message) {
                        main.alertMessage(response.message,"error");
                    }
                    if (response.field_error) {
                        main.setErrorForm(response.field_error,formObj);
                    }
                }
            }
        }, options);

        $.ajax(
            options
        )
        .fail(function(jqXHR, textStatus, errorThrown) {
            if (jqXHR.status == 500) {
                main.alertMessage(jqXHR.responseText);
            }else if(jqXHR.status == 404){
                main.alertMessage("Halaman tidak ditemukan");
            }else{
                main.alertMessage("Oops!','Maaf, telah terjadi kesalahan.","error");
            }
        })
        .always(function() {
            $.unblockUI();
            btnObj.button('reset');
            if(formObj.attr('enctype')=="multipart/form-data"){
                setTimeout(function() {
                    $('#fileUploadProgressTemplate',formObj).remove();
                }, 1000);
            }
        });
    },
    setErrorForm: function(field_error,formObj) {
        // clear current error message
        formObj.find(".invalid-feedback").remove();

        $.each(field_error, function(k, v) {

            var element = $("[name='"+k+"']" , formObj);
            // console.log(element);
            var error = $("<div/>")   // creates a div element
                             .addClass("invalid-feedback")   // add a class
                             .html(v);

            element.closest('.form-group').addClass('has-danger');
            element.addClass('is-invalid');
            // element.closest('.help-block').remove();

            // if (element.parents('.mt-radio-list').size() > 0 || element.parents('.mt-checkbox-list').size() > 0) {
            //     if (element.parents('.mt-radio-list').size() > 0) {
            //         error.appendTo(element.parents('.mt-radio-list')[0]);
            //     }
            //     if (element.parents('.mt-checkbox-list').size() > 0) {
            //         error.appendTo(element.parents('.mt-checkbox-list')[0]);
            //     }
            // }else if (element.parents('.mt-radio-inline').size() > 0 || element.parents('.mt-checkbox-inline').size() > 0) {
            //     if (element.parents('.mt-radio-inline').size() > 0) {
            //         error.appendTo(element.parents('.mt-radio-inline')[0]);
            //     }
            //     if (element.parents('.mt-checkbox-inline').size() > 0) {
            //         error.appendTo(element.parents('.mt-checkbox-inline')[0]);
            //     }
            // }else 
            if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());      // radio/checkbox?
            } else if (element.hasClass('select2-hidden-accessible')) {
                error.insertAfter(element.next('span'));  // select2
            } else {
                error.insertAfter(element);               // default
            }
        });
    },
    dropdownAjax: function(targetObj,send_data,url) {
        targetObj.html("<option value='' >Loading...</option>");
        targetObj.select2("val", "");
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: send_data,
            beforeSend: function (e) {
                targetObj.prop("disabled", true);
            }
        })
        .done(function(response) {
            // console.log("success");
            if(response){
                if (response.length > 0 ) {
                    targetObj.html("<option value='' >Pilih</option>");

                    for(i=0;i<response.length;i++){
                        var option = "<option value='"+response[i]['id']+"' ";
                        option += " >"+response[i]['nama']+"</option>";
                        targetObj.append(option);
                    }
                    targetObj.prop("disabled", false);
                }else{
                    targetObj.html("<option value='' >Tidak ada data</option>");
                }
                targetObj.select2("val", "");
            }
        })
        .fail(function(response) {
            console.log('error');
            // main.alertMessage('Oops!', response.message, 'warning');
        })
        .always(function() {
            // console.log("complete");
        });

    },
    simpleDatatable: function (options) {
        var TableDatatablesAjax = function (options) {
            var grid = new Datatable();
            grid.init({
                src: options.src,
                dataTable: {
                    "ajax": {
                        "url": options.url, // ajax source
                    },
                    "order": [
                        [1, "asc"]
                    ]// set first column as a default sort by asc
                }
            });
        }
        jQuery(document).ready(function() {
           TableDatatablesAjax(options);
        });
    },



};
var sonifjs = function() {

    // Handle Select2 Dropdowns
    var handleSelect2 = function() {
        if ($().select2) {
            // $.fn.select2.defaults.set("theme", "bootstrap");
            $(".select2me").each(function() {
                var dropdown = $(this);

                // console.log(allowClear);
                if (!$(dropdown).hasClass('select2-hidden-accessible')){
                    dropdown.select2({
                        placeholder: "Select",
                        width: '100%',
                        dropdownAutoWidth : true,
                    });
                }
            });

            function formatRepo(repo) {
                if (repo.loading) return repo.text;

                var markup = "<div class='select2-result-repository clearfix'>";
                if (repo.img  !== undefined ) {
                    markup += "<div class='select2-result-repository__avatar'><img src='" + repo.img + "' /></div>";
                }
                if (repo.title  !== undefined ) {
                    markup += "<div class='select2-result-repository__title'>" + repo.title + "</div>";
                }
                if (repo.desc  !== undefined ) {
                    markup += "<div class='select2-result-repository__description'>" + repo.desc + "</div>" ;
                }
                if (repo.rating  !== undefined ) {
                    markup += "<div class='select2-result-repository__stargazers'>" + repo.rating+ " <span class='glyphicon glyphicon-star'></span></div></div>" ;
                }

                return markup;
            }

            function formatRepoSelection(repo) {
                if (typeof do_after_select !== 'undefined' && $.isFunction(do_after_select)) {
                    do_after_select(repo);
                }
                return repo.title || repo.text;
            }
            var __cache = [];
            $(".select2-ajax").each(function() {
                var dropdown = $(this);
                if (!$(dropdown).hasClass('select2-hidden-accessible'))
                {
                    var url = $(this).attr('data-url');

                    var allowClear = true;
                    if($(this).attr('data-allowClear') == 'false'){
                        var allowClear = false;
                    }

                    var placeholder = 'Pilih';
                    if (dropdown.data('placeholder')) {
                        placeholder = dropdown.data('placeholder');
                    }

                    var ajaxParams = {};
                    if (dropdown.data('param')) {
                        ajaxParams = dropdown.data('param');
                    }
                    var dataRef = {};
                    if (dropdown.data('ref')) {
                        dataRef = dropdown.data('ref');
                    }
                     // console.log(dropdown.data('ref'));
                    //  console.log(url);
                     dropdown.select2({
                         placeholder: placeholder,
                         allowClear: allowClear,
                         width: "100%", //off
                         dropdownAutoWidth : true,
                         minimumResultsForSearch: 5 ,
                         ajax: {
                             url: url,
                             dataType: 'json',
                             delay: 250,
                            //  cache with trasport
                             transport: function(params, success, failure) {
                                //retrieve the cached key or default to _ALL_
                                var __cachekey = url+params.data.q || '_ALL_';
                                if ('undefined' !== typeof __cache[__cachekey]) {
                                  //display the cached results
                                  success(__cache[__cachekey]);
                                  return; /* noop */
                                }
                                var $request = $.ajax(params);
                                $request.then(function(data) {
                                  //store data in cache
                                  __cache[__cachekey] = data;
                                  //display the results
                                  success(__cache[__cachekey]);
                                });
                                $request.fail(failure);
                                return $request;
                              },
                             data: function(params) {
                                $.each(ajaxParams, function(key, value) {
                                    params[key] = value;
                                });
                                $.each(dataRef, function(key, id) {
                                    params[id] = $("[name='"+id+"']").val();
                                });
                                params['q'] = params.term;
                                params['page'] = params.page;
                                return params;
                             },
                             processResults: function(data, params) {
                                 // parse the results into the format expected by Select2.
                                 // since we are using custom formatting functions we do not need to
                                 // alter the remote JSON data
                                 params.page = params.page || 1;
                                 return {
                                     results: data.items,
                                     pagination: {
                                          more: (params.page * 30) < data.total_count
                                      }
                                 };
                             },
                             cache: true
                         },
                         escapeMarkup: function(markup) {
                             return markup;
                         }, // let our custom formatter work
                         minimumInputLength: 0,
                         templateResult: formatRepo,
                         templateSelection: formatRepoSelection
                     });
                 }
             });
        }
    };

    // Handle date picker
    var handleDatePickers = function () {

        if (jQuery().datepicker) {
            $('.date-picker').datepicker({
                orientation: "left",
                format:'yyyy-mm-dd',
                autoclose: true
            });
            $('.date-decade').datepicker({
                orientation: "left",
                format:'yyyy-mm-dd',
                startView: 'decade' ,
                autoclose: true
            });
            $('.date-year').datepicker({
                orientation: "left",
                format:'yyyy',
                minViewMode:'years',
                autoclose: true
            });
            //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
        }

    }

    var initUpload = function() {
        $(".upload_img_single").click(function (e) { //console.log("a");
            var imgId = '#'+$(this).attr("id");
            var photo_before = $(this).attr("src");
            var hiddenInputId = '#'+$(this).parent().find( 'input:hidden' ).attr("id");
            var modal_upload_options={
                "targetImgId": imgId,
                "photo":photo_before,
                "hiddenInputId" : hiddenInputId,
            };

            if (document.getElementById('div_upload') === null){
              var iDiv = document.createElement('div');
              iDiv.id = 'div_upload';
              $(this).parent().append(iDiv);
            }

            $('#div_upload').load(site_url+'/upload/single',modal_upload_options ,
                function(){
                /* Stuff to do after the page is loaded */
            });
        });
    };

    // Handle load modal
    var handleModal = function() {
        $('body').on('click', '.openmodal', function(event) {
            event.preventDefault();
            var btnObj = $(this);
            btnObj.attr("disabled", "disabled");


            var attribut = $(this).data();
            attribut['modal'] = true ;
            // console.log('load modal');
            var div_load_modal = '#temp_modal';
            if (attribut.stack) {
                div_load_modal += attribut.stack;
            }
            if (attribut.id) {
                var div_load_modal = '#'+attribut.id;
                if ($(div_load_modal).length == 0){
                    $('#custome_modal').append('<div id="'+attribut.id+'"></div>');
                }
            }
            // console.log(div_load_modal);
            if (typeof attribut.url !== 'undefined')
                var url = attribut.url;
            else
                var url = $(this).attr("href");
            $(div_load_modal).load( url , attribut , function() {
            //   alert( "Load was performed." );
                // console.log('loaded');
                btnObj.removeAttr("disabled");

            });


        });
    };

    var handleStatic = function () {
        $("form.readonly").each(function(index, el) {
            // console.log($("button[type='submit']", el));
            $("button[type='submit']", el).remove();
            $("button.dz_remove_button", el).remove();
            $("input", el).attr("disabled", true);
            $("input", el).removeAttr('placeholder');
            $("textarea", el).attr("disabled", true);
            $("select",el).prop("disabled", true);
        });
    };

    var handleInputMask = function () {
        if (jQuery().inputmask) {
            $('.input-int-separator').inputmask("numeric", {
                radixPoint: ",",
                groupSeparator: ".",
                digits: 2,
                autoGroup: true,
                // prefix: '$',
                rightAlign: false,
                // oncleared: function () { self.Value(''); }
            });
            $('.input-int').inputmask("numeric",{
                digits: 0,
                rightAlign: false,
            });
            $('.input-numeric').inputmask("numeric",{
                rightAlign: false,
            });
        }
    }


    return {

        //main function to initiate the theme
        init: function() {
            handleSelect2();
            handleDatePickers();
            handleModal();
            initUpload();
            handleStatic();
            handleInputMask();
        },
        initAjax: function () {
            handleSelect2();
            handleDatePickers();
            handleStatic();
            handleInputMask();
        },
        loadPage : function (el,url,filter) {
            el.html("");
            // App.blockUI({
            //     target: el,
            //     // boxed: true,
            //     // overlayColor: 'none',
            //     animate: true
            // });
            // el.load(url,filter,function(result){
            //     App.unblockUI(el);
            // });
        }
    };
}();

jQuery(document).ready(function() {
   sonifjs.init(); // init metronic core componets
});
//================================

var money = new Intl.NumberFormat('id-ID', {
// style: 'currency',
currency: 'IDR',
minimumFractionDigits: 0,
});

function formatMoney(number) {
    return money.format(number);
}
