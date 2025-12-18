<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="ERP - Login app">
  <meta name="author" content="Binotech dev">
  <title>Login App</title>
  <!-- Favicon -->
  <link href="<?php echo base_url('assets') ?>/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Icons -->
  <link href="<?php echo base_url('assets') ?>/js/plugins/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="<?php echo base_url('assets') ?>/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="<?php echo base_url('assets') ?>/css/argon-dashboard.css" rel="stylesheet">

  <link href="<?php echo base_url('assets') ?>/js/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />

</head>

<body class="bg-default">
  <div class="main-content">	
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-7">
      
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary shadow border-0">
            <!-- <div class="card-header bg-transparent">
              <div class="text-center text-muted mb-4">
              </div>
            </div> -->
            <div class="card-body px-lg-5 py-lg-4 text-center">
              <h1><?php echo APP_NAME ?></h1>
              <img src="<?php echo base_url('assets/djadol.png') ?>" width="100%" style="max-width:240px;max-height:240px;" class="pb-4"/>
              <form role="form" id="login-form" action="<?php echo site_url('auth/login_action') ?>" method="post">
                <div class="form-group mb-3">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="Email" type="text" name="email">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password" name="password">
                  </div>
                </div>                
                <div class="text-center">
                  <button type="submit" class="btn btn-primary my-4">Sign in</button>
                </div>
              </form>
            </div>
          </div>
          <!-- <div class="row mt-3">
            <div class="col-6">
              <a href="#" class="text-light"><small>Forgot password?</small></a>
            </div>
            <div class="col-6 text-right">
              <a href="#" class="text-light"><small>Create new account</small></a>
            </div>
          </div> -->
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
  <footer class="py-5">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-12">
          <div class="copyright text-center text-muted">
            &copy; 2025 <a href="#" class="font-weight-bold ml-1" target="_blank"><?php echo COMAPANY_NAME ?></a> 1.1.2
          </div>
        </div>        
      </div>
    </div>
  </footer>
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Argon JS -->
  <script src="<?php echo base_url('assets') ?>/js/argon-dashboard.min.js"></script>

  <script src="<?php echo base_url('assets') ?>/js/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>

  <!-- Block UI -->
  <script src="<?php echo base_url('assets') ?>/js/plugins/jquery.blockUI.min.js"></script>

  <script src="<?php echo base_url('assets') ?>/js/sonif.js"></script>

  <script>
        $("#login-form").submit(function(e) {
            e.preventDefault();
            main.submitAjaxModal($(this));
        });
  </script>
</body>

</html>
