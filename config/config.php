<?php
define('SQL_DIR', 'sql');
define('ADMIN_DIR', 'admin');
define('ADDON_DIR', 'addon');
define('TPL_DIR', 'template');
define('LANG_DIR', 'language');
define('FONT_DIR', 'font');
define('SUBSCRIBE_DIR', 'subscribe');
define('ADMIN_LOG', false);
// token
define('TOKEN_ON', false); // token开启为true
define('TOKEN_NAME', 'token');
// 上传图片限制大小
define('UPLOAD_LIMIT', true);
define('UPLOAD_IMG', 600);
// 验证码
define('VERIFYCODE_WIDTH', 150);
define('VERIFYCODE_HEIGHT', 50);
// 初始化页面
define('REWRITE', false);
define('CART', false); // 对应购物车cls.cart类使用及运费的后台配置
define('COOKIE_TIMEOUT', 15 * 60); //超时
define('COOKIE_EXPIRE', 30 * 24 * 3600); // cookie超期时间(天*时*秒)
// 短网址
define('URL_DWZ', 'http://dwz.cn/create.php');
// 后台无须验证的页面
define('ADMIN_EXCLUDE', '["cms_login.php","verifycode.php","index.php"]');

// 时差
$GLOBALS['timezone'] = 8;
