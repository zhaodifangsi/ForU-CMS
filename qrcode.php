<?php
$wxpay_qrcode = 'wxpay_qrcode.jpg';

if (is_wechat_qrcode()) {
	echo '<img src="'.$wxpay_qrcode.'" style="max-width:100%;">';
} elseif (is_alipay_qrcode()) {
	$url = 'HTTPS://QR.ALIPAY.COM/FKX09689RDIHPYESAYVT81';
	header('Location:' . $url);
}

function is_wechat_qrcode() {
  return (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false);
}
function is_alipay_qrcode() {
	return (strpos($_SERVER['HTTP_USER_AGENT'], 'AlipayClient') !== false);
}