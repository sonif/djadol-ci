<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
  <div class=" dropdown-header noti-title">
    <!-- <h6 class="text-overflow m-0">Welcome! </h6> -->
    <h5 class="text-overflow m-0"><?php echo $user->email ?></h5>
  </div>
  <a href="#" data-url="<?php echo site_url('auth/profile/change_password') ?>" class="dropdown-item openmodal">
    <i class="ni ni-single-02"></i>
    <span>Change Password</span>
  </a>
  <div class="dropdown-divider"></div>
  <a href="<?php echo site_url('auth/logout'); ?>" class="dropdown-item">
    <i class="ni ni-user-run"></i>
    <span>Logout</span>
  </a>
</div>
