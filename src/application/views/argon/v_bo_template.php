<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="ERP App">
  <meta name="author" content="Binotech dev">
  <title><?php echo APP_NAME ?></title>
  <!-- Favicon -->
  <link href="<?php echo base_url('assets') ?>/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Icons -->
  <link href="<?php echo base_url('assets') ?>/js/plugins/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="<?php echo base_url('assets') ?>/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="<?php echo base_url('assets') ?>/css/argon-dashboard.css" rel="stylesheet">

  <!-- Core -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Argon JS -->
  <script src="<?php echo base_url('assets') ?>/js/argon-dashboard.min.js"></script>


  <!-- Sweet Alert -->
  <link href="<?php echo base_url('assets') ?>/js/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>

  <!-- Select2 -->
  <!-- <link href="<?php echo base_url('assets') ?>/js/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
  <link href="<?php echo base_url('assets') ?>/js/plugins/select2/css/select2.css" rel="stylesheet" type="text/css" />
  <script src="<?php echo base_url('assets') ?>/js/plugins/select2/js/select2.min.js" type="text/javascript"></script>

  <!-- datatable -->
  <!-- <link rel="stylesheet" href="<?php echo base_url('assets') ?>/js/plugins/datatables/jquery.dataTables.css">
  <link rel="stylesheet" href="<?php echo base_url('assets') ?>/js/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.css">
  <script src="<?php echo base_url('assets') ?>/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
  <script src="<?php echo base_url('assets') ?>/js/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.js" type="text/javascript"></script> -->

  <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets') ?>/js/plugins/datatables/datatables.min.css"/>
  <script type="text/javascript" src="<?php echo base_url('assets') ?>/js/plugins/datatables/datatables.min.js"></script>
  <!-- base datatable -->
  <script src="<?php echo base_url('assets') ?>/js/datatable.js" type="text/javascript"></script>

  <!-- datepicker -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

  <!-- fileinput -->
  <link href="<?php echo base_url('assets') ?>/js/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>

  <!-- fancybox -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
  <script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>

  <!-- inputmask -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>

  <!-- printhis -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/printThis.js"></script>

  <!-- Block UI -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/jquery.blockUI.min.js"></script>
  
  <link type="text/css" href="<?php echo base_url('assets') ?>/css/my.css" rel="stylesheet">


</head>

<body>
  <!-- Sidenav -->
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="<?php echo site_url('home')?>">
        <img src="<?php echo base_url('assets') ?>/img/brand/logo_app.png" class="navbar-brand-img" style="max-height:10rem" alt="..." height="80">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <!-- <li class="nav-item">
          Hallo
        </li> -->
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                  <i class="fa fa-user"></i>
              </span>
            </div>
          </a>
            <?php $this->load->view('argon/v_user_dropdown_menu'); ?>
          
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <!-- <div class="col-6 collapse-brand">
              <a href="#">
                <img src="<?php echo base_url('assets') ?>/img/brand/blue.png">
              </a>
            </div> -->
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Navigation -->
        <ul class="navbar-nav">
          <?php echo tree_menu($usergroup_id,$menu_kode) ?>
          <?php echo flow_menu($usergroup_id,$menu_kode) ?>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content">
    <!-- Top navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="<?php echo site_url('home')?>"><?php echo APP_NAME ?></a>
          <!-- Sidenav toggler -->
          <div class="sidenav-toggler d-none d-xl-block active" data-action="sidenav-unpin" data-target="#sidenav-main">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </div>
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <!-- <li class="nav-item">
            <button id="btn_cekbelum" class="btn btn-default" data-toggle="modal" data-target="#modal-belum-input">Cek Belum Input</button>  
          </li> -->
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <i class="fa fa-user"></i>
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold"></span>
                </div>
              </div>
            </a>
            <?php $this->load->view('argon/v_user_dropdown_menu'); ?>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Header -->
    <div class="header bg-gradient-primary pb-8 pt-5">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <!-- <div class="card shadow"> -->
        <!-- <div style="margin: 3px;"> -->
        <?php echo $page_content ?>
        <!-- </div> -->
      <!-- </div> -->
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              <!-- &copy; 2020  -->
              <a href="http://kopicode.com" class="font-weight-bold ml-1" target="_blank"> Powered by fal-son</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <div id="temp_modal"></div>
  <div id="custome_modal"></div>
  <!-- Argon Scripts -->


  <!-- Modal -->
  <div class="modal fade" id="modal-belum-input" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Data Belum Input</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <div class="modal-body">           
                <?php
                  //$this->load->view('argon/v_transaksi_belum');
                ?>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  
  <script src="<?php echo base_url('assets') ?>/js/formx/general_utils.js"></script>
  <script src="<?php echo base_url('assets') ?>/js/sonif.js"></script>

</body>

</html>
