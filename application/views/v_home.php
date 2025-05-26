<style>
  .textarabic{
    line-height: 2;
    font-size: 24px;
  }
</style>
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col-md-7">
            <h1 id="titleq"></h1>
          </div>
          <div class="col-md-5 text-right">
            <button class="btn btn-warning" onclick="prev()">prev</button>
            <button class="btn btn-default" onclick="random()">Random</button>
            <button class="btn btn-warning" onclick="next()">next</button>
          </div>
        </div>
      </div>
      <div class="card-body">
      <!-- <img src="<?php echo(base_url('assets/img/brand/home.svg')) ?>" width=600 height="300"  alt="home image">  -->
      <div id="loading" class="text-center mt-5"><div class="icon icon-shape bg-gradient-purple text-white rounded-circle shadow"><i class="fa fa-spinner fa-spin fa-2x fa-fw"></i></div></div>
      <div id="arabic" class="textarabic text-right" dir="rtl"></div>
      <div id="translate" class="mt-3" style="color:#808080"></div>
      <div id="refquran" class=""></div>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
         <a class="btn btn-warning" href="<?php echo base_url("android/djadol-release.apk"); ?>" target="blank">Download App-Android</a>
      </div>
    </div>

  </div>
</div>

<script>
var minimum = 1;
var maximum = 6236;
var nosurah = Math.floor(Math.random() * (maximum - minimum + 1)) + minimum;
// nosurah = 262;
loadAyat();


function prev() {
  if(nosurah>minimum) nosurah = nosurah-1;
  loadAyat();
}
function next() {
  if(nosurah<maximum) nosurah= nosurah+1;
  loadAyat();
}
function random() {
  nosurah = Math.floor(Math.random() * (maximum - minimum + 1)) + minimum;
  loadAyat();
}
function loadAyat() {
  $("#titleq").html('');
  $("#arabic").html('');
  $("#translate").html('');
  $("#refquran").html('');
  $("#loading").show();

  $.getJSON("http://api.alquran.cloud/v1/ayah/"+nosurah, {
      format : "jsonp"
  }, function(data)
  {    
    $("#loading").hide();

    $("#arabic").html(data.data.text);
    $("#titleq").html(data.data.surah.englishName+', ayat '+data.data.numberInSurah);
    $("#refquran").html('['+data.data.surah.number+':'+data.data.numberInSurah+']');
  });// define ajax setup
  $.getJSON("http://api.alquran.cloud/v1/ayah/"+nosurah+"/id.indonesian", {
      format : "jsonp"
  }, function(data)
  {    
    $("#translate").html(data.data.text);
  });
}
</script>