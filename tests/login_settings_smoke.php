<?php
// Run from the project root: php -n tests/login_settings_smoke.php
// Uses a connection-local temporary table; existing settings remain untouched.
if (PHP_SAPI !== 'cli') { exit('CLI only'); }
chdir(dirname(__DIR__));
$_SERVER['CI_ENV']='production';
$_SERVER['SERVER_NAME']='localhost';
$_SERVER['SERVER_PORT']='80';
$_SERVER['SCRIPT_NAME']='/index.php';
$_SERVER['REQUEST_METHOD']='GET';
$argv=array('index.php','auth/login'); $_SERVER['argv']=$argv;
ob_start(); require getcwd().'/index.php'; ob_end_clean();
$ci=get_instance();
if (!$ci->db->query('CREATE TEMPORARY TABLE m_config (config_id INT NOT NULL PRIMARY KEY, config_name VARCHAR(255), config_value VARCHAR(255)) ENGINE=MyISAM')) { fwrite(STDERR,json_encode($ci->db->error())."\n"); exit(1); }
$ci->load->model('auth/Login_settings_model','login_settings');
$model=$ci->login_settings;
function check($ok,$message) { if (!$ok) { throw new RuntimeException('FAIL: '.$message); } echo "PASS: ".$message."\n"; }
$defaults=$model->get_settings();
check($defaults['background_type']==='default' && $defaults['logo']==='assets/djadol.png','Defaults preserve original background and logo');
$fixture='uploads/login/'.bin2hex(random_bytes(16)).'.png';
imagepng(imagecreatetruecolor(2,2), FCPATH.$fixture);
try {
    $settings=$defaults; $settings['background_type']='color'; $settings['background_color']='#123abc';
    check($model->save_settings($settings),'Settings save on schema without auto increment');
    check($model->get_settings()===$settings,'Solid color survives reload');
    $html=$ci->load->view('auth/v_login_argon',array('login_settings'=>$settings),true);
    check(strpos($html,'background-color: #123abc')!==false && strpos($html,'bg-default login-custom-background')!==false,'Solid color applied to login page');
    $settings['background_type']='image'; $settings['background_image']=$fixture; $settings['logo']=$fixture;
    check($model->save_settings($settings) && $model->get_settings()===$settings,'Uploaded background and logo paths survive reload');
    check((int) $ci->db->query('SELECT COUNT(*) AS n FROM m_config')->row()->n===4,'Repeated saves update the same four settings');
    $html=$ci->load->view('auth/v_login_argon',array('login_settings'=>$model->get_settings()),true);
    check(strpos($html,'background-image: url("http:')!==false && strpos($html,'background-image: url(&quot;')===false,'Background image renders valid CSS');
    check(substr_count($html,basename($fixture))===2,'Uploaded background and logo both rendered');
    $settings['background_type']='default'; $settings['logo']='assets/djadol.png';
    check($model->save_settings($settings),'Reset background and logo');
    $html=$ci->load->view('auth/v_login_argon',array('login_settings'=>$model->get_settings()),true);
    check(strpos($html,'<body class="bg-default">')!==false && strpos($html,'assets/djadol.png')!==false && strpos($html,'background-image:')===false,'Reset renders original login layout');
    $ci->db->where('config_name','login_background_color')->update('m_config',array('config_value'=>'red;}</style><script>alert(1)</script>'));
    $ci->db->where('config_name','login_logo')->update('m_config',array('config_value'=>'../config/database.php'));
    $ci->db->where('config_name','login_background_type')->update('m_config',array('config_value'=>'image'));
    unlink(FCPATH.$fixture);
    $safe=$model->get_settings();
    check($safe['background_type']==='default' && $safe['background_color']==='#172b4d' && $safe['logo']==='assets/djadol.png','Invalid colors, traversal paths and missing images fall back safely');
    check(!$model->is_uploaded_image('uploads/login/../../x.php') && !$model->is_uploaded_image('uploads/login/'.str_repeat('a',32).'.svg'),'Only controlled raster upload paths accepted');
    $_SESSION=array();
    $ci->load->helper('security');
    $html=$ci->load->view('auth/v_login_settings',array('settings'=>$defaults,'settings_token'=>'isolated-test-token'),true);
    check(strpos($html,'multipart/form-data')!==false && strpos($html,'name="settings_token"')!==false,'Settings form supports uploads and request token');
} finally {
    if(is_file(FCPATH.$fixture)) unlink(FCPATH.$fixture);
    $ci->db->query('DROP TEMPORARY TABLE m_config');
}
