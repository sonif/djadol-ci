<!-- Card stats -->
<div class="row mt-2">
  <div class="col-xl-3 col-lg-6">
    <div class="card card-stats mb-4 mb-xl-0">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <span class="h2 font-weight-bold mb-0"><?php echo $jumlah_visitasi; ?></span>
          </div>
          <div class="col-auto">
            <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
              <i class="fas fa-motorcycle"></i>
            </div>
          </div>
        </div>
        <p class="mt-3 mb-0 text-muted text-sm">
          <h5 class="card-title text-uppercase text-muted mb-0">Total Kunjungan</h5>
        </p>
      </div>
    </div>
  </div>
  <div class="col-xl-3 col-lg-6">
    <div class="card card-stats mb-4 mb-xl-0">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <span class="h2 font-weight-bold mb-0">70</span>
          </div>
          <div class="col-auto">
            <div class="icon icon-shape bg-purple text-white rounded-circle shadow">
              <i class="fas fa-car-side"></i>
            </div>
          </div>
        </div>
        <p class="mt-3 mb-0 text-muted text-sm">
          <h5 class="card-title text-uppercase text-muted mb-0">Total Produk</h5>
        </p>
      </div>
    </div>
  </div>
  <div class="col-xl-3 col-lg-6">
    <div class="card card-stats mb-4 mb-xl-0">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <span class="h2 font-weight-bold mb-0"><?php echo $jumlah_agen; ?></span>
          </div>
          <div class="col-auto">
            <div class="icon icon-shape bg-success text-white rounded-circle shadow">
              <i class="fas fa-user-tag"></i>
            </div>
          </div>
        </div>
        <p class="mt-3 mb-0 text-muted text-sm">
          <h5 class="card-title text-uppercase text-muted mb-0">Jumlah Agen Sales</h5>
        </p>
      </div>
    </div>
  </div>
</div>

<div class="row mt-2">
  <div class="col-xl-3 col-lg-6">
    <div class="card card-stats mb-4 mb-xl-0 bg-primary">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <span class="h2 font-weight-bold mb-0 text-white"><?php echo empty($totalsales) ? "0" : $totalsales; ?></span>
          </div>
          <!-- <div class="col-auto">
            <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
              <i class="fas fa-user-tag"></i>
            </div>
          </div> -->
        </div>
        <p class="mt-3 mb-0 text-muted text-sm">
          <h5 class="card-title text-uppercase text-muted mb-0 text-white">Total Penjualan</h5>
        </p>
      </div>
    </div>
  </div>

</div>
