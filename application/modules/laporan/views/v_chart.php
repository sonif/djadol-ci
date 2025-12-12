<div class="">
  <div class="row mt-4">
    <div class="col-md-12">
      <div class="card bg-gradient-default shadow">
        <div class="card-header bg-transparent">
          <div class="row align-items-center">
            <div class="col">
              <div class="row">
                <div class="col-md-3">
                  <select name='cb_dusun' id="cb_dusun" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_dusun') ?>'>
                  </select>  
                </div>
                <div class="col-md-3">
                  <input type="text" class="form-control date-year" name="cb_tahun" id="cb_tahun" value="<?php echo date('Y'); ?>"/>
                </div>
                <div class="col-md-3">
                  <select name='cb_month' id="cb_month" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_month') ?>'>
                    <option value="<?php echo date('m'); ?>" selected="selected"><?php echo date('m'); ?></option>
                  </select>   
                </div>
                <div class="col-md-3">
                  <button class="btn btn-primary text-right" onclick="updateDailyChart()">Filter</button>
                </div>
              </div>
            </div>
            <div class="col text-right">
              <h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
              <h2 class="text-white mb-0">Daily</h2>
            </div>
          </div>
        </div>
        <div class="card-body">
          <!-- Chart -->
          <div class="chart">
            <!-- Chart wrapper -->
            <canvas id="chart-sales" class="chart-canvas"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<!--   Optional JS   -->
<script src="<?php echo base_url()?>/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
<script src="<?php echo base_url()?>/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
<script src="<?php echo base_url()?>/assets/js/plugins/chart.js/plugins/chartjs-plugin-datalabels.min.js"></script>
<!--   Argon JS   -->
<script src="<?php echo base_url()?>/assets/js/argon-dashboard.js?v=1.1.2"></script>

<script>
function updateDailyChart() {
  var data = {};
  data['dusun_id'] = $('#cb_dusun').val();
  data['m'] = $('#cb_month').val();
  data['y'] = $('#cb_tahun').val();
  $.post("<?php echo site_url('laporan/chart/datacamera_chart')?>", data,
    function(data, textStatus, jqXHR) {
      // console.log(data);
      var cam = $('#chart-sales').data('chart');
      replaceData(cam, data.datasets);
      replaceLabel(cam, data.labels);
    },
    "json"
  );
}
function replaceData(chart, newdata) {
  console.log(newdata);
  chart.data.datasets = newdata;
  chart.update();
}
function replaceLabel(chart, newLabel) {
  chart.data.labels = newLabel;
  chart.update();
}



$(document).ready(function() {
  // $('#filter_month_daily').val(moment().format("MMM YYYY"));
  // $('#filter_year').val(moment().format("YYYY"));
  // updatechart();
  // updateDailyChart();
});

'use strict';
var SalesChart = (function() {

  // Variables

  var $chart = $('#chart-sales');


  // Methods

  function init($chart) {

    var salesChart = new Chart($chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            gridLines: {
              lineWidth: 1,
              color: Charts.colors.gray[900],
              zeroLineColor: Charts.colors.gray[900]
            },
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k';
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'Performance',
          data: [0, 20, 10, 30, 15, 40, 20, 60, 60]
        }]
      }
    });

    // Save to jQuery object

    $chart.data('chart', salesChart);

  };


  // Events

  if ($chart.length) {
    init($chart);
  }

})();
</script>