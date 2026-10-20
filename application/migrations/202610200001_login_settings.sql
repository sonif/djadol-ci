-- Jalankan sekali pada database aplikasi. Aman dijalankan ulang.
-- Pengaturan login memakai m_config yang sudah ada; tanpa perubahan skema.
START TRANSACTION;

SET @login_sys_parent = (
    SELECT menu_id FROM s_menu
    WHERE menu_parent = 0 AND REPLACE(menu_nama, ' ', '') IN ('[<sys>]', '<sys>')
    ORDER BY menu_id LIMIT 1
);

INSERT INTO s_menu (menu_nama, menu_ket, menu_url, menu_icon, menu_parent, menu_active, menu_kode, menu_order)
SELECT 'Tampilan Login', 'Pengaturan background dan logo halaman login',
       'auth/login_settings', 'fa fa-image', @login_sys_parent, 'y', 'login_settings', 99
WHERE @login_sys_parent IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM s_menu WHERE menu_kode = 'login_settings' OR menu_url = 'auth/login_settings');

SET @login_settings_menu = (
    SELECT menu_id FROM s_menu WHERE menu_kode = 'login_settings' OR menu_url = 'auth/login_settings'
    ORDER BY menu_id LIMIT 1
);

-- ROLE_ADMIN = 1, sesuai application/config/constants.php.
INSERT INTO s_akses (usergroup_id, menu_id, akses_active, akses_code)
SELECT 1, @login_settings_menu, 'y', '["xread","xupdate"]'
WHERE @login_settings_menu IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM s_akses WHERE usergroup_id = 1 AND menu_id = @login_settings_menu);

COMMIT;
