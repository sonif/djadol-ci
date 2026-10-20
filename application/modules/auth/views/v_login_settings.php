<div class="card">
  <div class="card-header d-flex justify-content-between align-items-center flex-wrap">
    <h3 class="mb-2">Tampilan Login</h3>
    <a href="<?php echo site_url('auth/login'); ?>" target="_blank" rel="noopener" class="btn btn-outline-primary btn-sm">Lihat halaman login</a>
  </div>
  <div class="card-body">
    <?php foreach (array('success', 'error') as $status): ?>
      <?php if ($message = $this->session->flashdata('login_settings_'.$status)): ?>
        <div role="alert" class="alert alert-<?php echo $status === 'success' ? 'success' : 'danger'; ?>"><?php echo html_escape($message); ?></div>
      <?php endif; ?>
    <?php endforeach; ?>
    <?php echo form_open_multipart('auth/login_settings/save', array('id' => 'login-settings-form')); ?>
      <input type="hidden" name="settings_token" value="<?php echo html_escape($settings_token); ?>">
      <div class="row">
        <div class="col-lg-6">
          <div class="form-group">
            <label for="background_type">Background halaman login</label>
            <select class="form-control" name="background_type" id="background_type">
              <?php foreach (array('default' => 'Default (tampilan saat ini)', 'color' => 'Warna solid', 'image' => 'Gambar upload') as $value => $label): ?>
                <option value="<?php echo $value; ?>" <?php echo $settings['background_type'] === $value ? 'selected' : ''; ?>><?php echo $label; ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <div class="form-group" id="background-color-field">
            <label for="background_color">Warna background</label>
            <input type="color" class="form-control" name="background_color" id="background_color" value="<?php echo html_escape($settings['background_color']); ?>" style="max-width:160px;height:48px;">
          </div>
          <div class="form-group" id="background-image-field">
            <label for="background_image">Upload background</label>
            <input type="file" class="form-control-file" name="background_image" id="background_image" accept="image/jpeg,image/png,image/gif">
            <small class="form-text text-muted">JPG, PNG, atau GIF. Maksimal 4 MB dan 6000 × 6000 piksel. Kosongkan untuk memakai gambar yang tersimpan.</small>
            <?php if ($settings['background_image']): ?>
              <a class="d-inline-block mt-2" href="<?php echo html_escape(base_url($settings['background_image'])); ?>" target="_blank" rel="noopener">Lihat background tersimpan</a>
            <?php endif; ?>
          </div>
          <hr>
          <div class="form-group">
            <label for="logo">Upload logo</label>
            <input type="file" class="form-control-file" name="logo" id="logo" accept="image/jpeg,image/png,image/gif">
            <small class="form-text text-muted">JPG, PNG, atau GIF. Maksimal 4 MB dan 6000 × 6000 piksel. Kosongkan untuk mempertahankan logo. Default: logo aplikasi saat ini.</small>
          </div>
          <div class="form-check mb-4">
            <input type="checkbox" class="form-check-input" id="default_logo" name="default_logo" value="1">
            <label class="form-check-label" for="default_logo">Kembalikan ke logo default</label>
          </div>
          <button type="submit" class="btn btn-primary">Simpan pengaturan</button>
        </div>
        <div class="col-lg-6 mt-4 mt-lg-0">
          <h4>Pratinjau</h4>
          <div id="login-preview" class="rounded p-4 text-center" style="min-height:360px;background-size:cover;background-position:center;position:relative;overflow:hidden;">
            <div id="preview-default-header" style="position:absolute;inset:0 0 auto;height:45%;background:linear-gradient(87deg,#5e72e4,#825ee4);transform:skewY(-3deg);transform-origin:top left;"></div>
            <div class="card bg-secondary shadow border-0 mx-auto mt-4 mb-0" style="max-width:300px;position:relative;">
              <div class="card-body">
                <h3><?php echo html_escape(APP_NAME); ?></h3>
                <img id="preview-logo" src="<?php echo html_escape(base_url($settings['logo'])); ?>" alt="Logo aplikasi" class="mb-3" style="max-width:100%;width:160px;height:120px;object-fit:contain;">
                <div class="bg-white rounded text-muted text-left p-2 mb-2">Email</div>
                <div class="bg-white rounded text-muted text-left p-2 mb-3">Password</div>
                <span class="btn btn-primary btn-sm">Sign in</span>
              </div>
            </div>
          </div>
          <small class="form-text text-muted mt-2">Pratinjau akan mengikuti pilihan Anda. Klik Simpan pengaturan untuk menerapkan ke halaman login.</small>
        </div>
      </div>
    <?php echo form_close(); ?>
  </div>
</div>
<script>
(function () {
  var type = document.getElementById('background_type');
  var color = document.getElementById('background_color');
  var backgroundInput = document.getElementById('background_image');
  var logoInput = document.getElementById('logo');
  var defaultLogo = document.getElementById('default_logo');
  var preview = document.getElementById('login-preview');
  var backgroundUrl = <?php echo json_encode($settings['background_image'] ? base_url($settings['background_image']) : '', JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;
  var logoUrl = <?php echo json_encode(base_url($settings['logo']), JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;
  var defaultLogoUrl = <?php echo json_encode(base_url('assets/djadol.png'), JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;
  function updatePreview() {
    document.getElementById('background-color-field').hidden = type.value === 'default';
    document.getElementById('background-image-field').hidden = type.value !== 'image';
    document.getElementById('preview-default-header').hidden = type.value !== 'default';
    preview.style.backgroundColor = type.value === 'default' ? '#172b4d' : color.value;
    preview.style.backgroundImage = type.value === 'image' && backgroundUrl ? 'url(' + JSON.stringify(backgroundUrl) + ')' : 'none';
    document.getElementById('preview-logo').src = defaultLogo.checked ? defaultLogoUrl : logoUrl;
    logoInput.disabled = defaultLogo.checked;
  }
  function previewFile(input, callback) {
    input.addEventListener('change', function () {
      if (!input.files.length) { callback(null); return; }
      var file = input.files[0];
      if (!/^image\/(jpeg|png|gif)$/.test(file.type) || file.size > 4 * 1024 * 1024) {
        window.alert('Pilih gambar JPG, PNG, atau GIF dengan ukuran maksimal 4 MB.');
        input.value = '';
        callback(null);
        return;
      }
      var reader = new FileReader();
      reader.onload = function () { callback(reader.result); };
      reader.readAsDataURL(file);
    });
  }
  var savedBackground = backgroundUrl;
  var savedLogo = logoUrl;
  previewFile(backgroundInput, function (url) { backgroundUrl = url || savedBackground; updatePreview(); });
  previewFile(logoInput, function (url) { logoUrl = url || savedLogo; updatePreview(); });
  type.addEventListener('change', updatePreview);
  color.addEventListener('input', updatePreview);
  defaultLogo.addEventListener('change', updatePreview);
  updatePreview();
}());
</script>
