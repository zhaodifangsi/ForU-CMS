<?php
// error_reporting(E_ALL ^ E_WARNING ^ E_NOTICE);
@session_start();
header('Content-type: text/html;charset=UTF-8');
define('LIB_PATH', str_replace("\\",'/',dirname(__FILE__).'/'));
define('ROOT_PATH', str_replace("library/",'',LIB_PATH));
define('ADDON_PATH', str_replace("library/",'addon/',LIB_PATH));

// 引入文件
include ROOT_PATH . 'config/config.php';
include ROOT_PATH . 'config/data.php';
include ROOT_PATH . 'config/smtp.php';

include_once LIB_PATH . 'cls.smtp.php';
include_once LIB_PATH . 'cls.hook.php';
include_once LIB_PATH . 'lib.time.php';

include_once LIB_PATH . 'lib.file.php';
include_once LIB_PATH . 'lib.url.php';
include_once LIB_PATH . 'lib.base.php';
include_once LIB_PATH . 'library.php';
include_once LIB_PATH . 'lib.user.php';

include LIB_PATH . 'cls.sql.php';
// engine
if(mysqliinstalled()) {
  include_once LIB_PATH . 'cls.mysqi.php';
  $db = new Mysqi(DATA_HOST, DATA_USERNAME, DATA_PASSWORD, DATA_NAME);
} else {
  include_once LIB_PATH . 'cls.mysql.php';
  $db = new Mysql(DATA_HOST, DATA_USERNAME, DATA_PASSWORD, DATA_NAME);
}
$GLOBALS['db'] = &$db;

//cms_system
$GLOBALS['cms'] = $cms = $db->getRow("SELECT * FROM system WHERE id = 1");

// 调试数据连接
if($db->_err) die($db->_err);

// 购物车
// if(CART) {
//   include_once LIB_PATH . 'cls.cart.php';
//   if(!isset($cart) && isset(getUserToken('id'))) $cart = new Cart();
// }

// 转义操作
if(!get_magic_quotes_gpc()) {
  if($_GET) $_GET = addslashes_deep($_GET);
  if($_POST) $_POST = addslashes_deep($_POST);
  if($_COOKIE) $_COOKIE = addslashes_deep($_COOKIE);
  if($_REQUEST) $_REQUEST = addslashes_deep($_REQUEST);
}

// 模板路径
$t_path = TPL_DIR . '/' . (!empty($_COOKIE['cms']['template_id']) ? $_COOKIE['cms']['template_id'] : $cms['s_template']) . '/';
$GLOBALS['t_path'] = &$t_path;

// 语言
$lang = LANG_DIR . '/' . (!empty($_COOKIE['cms']['lang']) ? $_COOKIE['cms']['lang'] : $cms['s_lang']) . '/';

// 加载语言
include ROOT_PATH . $lang . 'common.php';
include ROOT_PATH . $lang . 'admin.php';
include ROOT_PATH . $lang . 'priv.php';
$GLOBALS['lang'] = $_lang;

// 闭站判断
if($cms['s_state'] && !is_admin()) die($_lang['sys']['site_close']);

// admin
if(is_admin()) {
  include_once LIB_PATH . 'cls.dataops.php';
  include_once LIB_PATH . 'lib.admin.php';
  if(in_array(self_name(), json_decode(ADMIN_EXCLUDE))===false) include ROOT_PATH.ADMIN_DIR.'/cms_check.php';
}

// token
if(TOKEN_ON && !is_admin()) {
  include_once LIB_PATH . 'cls.token.php';
  $cms[TOKEN_NAME] = new Token();
}

// common
if(!isset($_COOKIE['cms']['user_id'])) $_COOKIE['cms']['user_id'] = 0;
if(!isset($_COOKIE['cms']['user_name'])) $_COOKIE['cms']['user_name'] = '';
if(!isset($_COOKIE['cms']['remember'])) $_COOKIE['cms']['remember'] = 0;
$id = isset($_GET['id']) && $_GET['id'] > 0 ? str_safe($_GET['id']) : 0;
$act = !empty($_POST['act']) ? str_safe($_POST['act']) : (!empty($_GET['act']) ? str_safe($_GET['act']) : '');

// head
if(is_detail()) {
  include_once LIB_PATH . 'cls.detail.php';
  include_once LIB_PATH . 'cls.channel.php';
  $objDetail = new Detail();
  $detail = $objDetail->getDetail($id);
  $objChannel = new Channel();
  $channel = $objChannel->getChannel($detail['d_parent']);

  $title = $detail['d_name'] . '-' . $channel['c_name'] . '-' . $cms['s_name'];
  $keywords = !empty($detail['d_keywords']) ? $detail['d_keywords'] : $detail['d_name'];
  $description = !empty($detail['d_description']) ? str_cut(str_text($detail['d_description'], 1), 220) : str_cut(str_text($cms['s_description'], 1), 220);
}
elseif(is_channel()) {
  include_once LIB_PATH . 'cls.channel.php';
  $objChannel = new Channel();
  $channel = $objChannel->getChannel($id);

  $title = $channel['c_name'] . '-' . $cms['s_name'];
  $keywords = !empty($channel['c_keywords']) ? $channel['c_keywords'] : $channel['c_name'];
  $description = !empty($channel['c_description']) ? $str_cut(str_text($channel['c_description'], 1), 220) : str_cut(str_text($cms['s_description'], 1), 220);
}
else{
  $title = !empty($cms['s_seoname']) ? $cms['s_name'] . '-' . $cms['s_seoname'] : $cms['s_name'];
  $keywords = $cms['s_keywords'];
  $description = str_cut(str_text($cms['s_description'], 1), 220);
}

// addon
$arr_addons = $db->getAll("SELECT DISTINCT a_func FROM addon");
foreach ($arr_addons as $val) {
  $arr_addon = $db->getAll("SELECT * FROM addon WHERE a_func = '".$val['a_func']."' AND a_enable = 1 ORDER BY a_order ASC,id ASC");
  foreach ($arr_addon as $v) {
    $data_addon[$val['a_func']][] = $v['a_name'];
  }
}
Hook::import($data_addon);
unset($arr_addons);
unset($arr_addon);
unset($data_addon);

// 默认分页结构
$cms['page_structure'] = Array('0' => '<li><a href="', '1' => '1.html" title="首页">&laquo;</a></li>', '2' => '<li class="am-disabled"><a href="javascript:;" title="上一页">&lsaquo;</a></li>', '3' => '.html" title="上一页">&lsaquo;</a></li>', '4' => '<li class="am-active"><a href="javascript:void(0)">', '5' => '</a></li>', '6' => '.html" title="第', '7' => '页">', '8' => '.html" title="尾页">&raquo;</a></li>', '9' => '<li class="am-disabled"><a href="javascript:;" title="下一页">&rsaquo;</a></li>', '10' => '.html" title="下一页">&rsaquo;</a></li>', '11' => '=1" title="首页">&laquo;</a></li>', '12' => '" title="上一页">&lsaquo;</a></li>', '13' => '" title="第', '14' => '" title="尾页">&raquo;</a></li>', '15' => '" title="下一页">&rsaquo;</a></li>', '16' => '<li class="am-active"><a href="javascript:void(0)">', '17' => '</a></li>');
