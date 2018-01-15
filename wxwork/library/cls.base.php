<?php
namespace Wxwork;
/*
require_once('library/cls.jssdkwork.php');
$app = array('wx2170ede3bb42d95c','40b93bb0062f0210ff520a12e549bec1');
$jssdk = new Base($app[0], $app[1]);
$signPackage = $jssdk->getSignPackage();
 */

class Base {
  private $corpId;
  private $corpSecret;

  public function __construct($corpId, $corpSecret) {
    $this->corpId = $corpId;
    $this->corpSecret = $corpSecret;
  }

  public function getSignPackage() {
    $jsapiTicket = $this->getJsApiTicket();
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $timestamp = time();
    $nonceStr = $this->createNonceStr();

    // 这里参数的顺序要按照 key 值 ASCII 码升序排序
    $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

    $signature = sha1($string);

    $signPackage = array(
      "appId"     => $this->corpId,
      "nonceStr"  => $nonceStr,
      "timestamp" => $timestamp,
      "url"       => $url,
      "signature" => $signature,
      "rawString" => $string
    );
    return $signPackage;
  }

  private function createNonceStr($length = 16) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $str = "";
    for ($i = 0; $i < $length; $i++) {
      $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
    }
    return $str;
  }

  private function getJsApiTicket() {
    // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
    $data = json_decode(file_get_contents("../jsapi_ticket_work.json"), true);
    $expire_time = !empty($data->expire_time) ? $data->expire_time : 0;
    if ($expire_time < time()) {
      $access_token = $this->getAccessToken();
      $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$access_token";
      $res = json_decode(\http_get($url), true);
      $ticket = $res['ticket'];
      if ($ticket) {
        $data['expire_time'] = time() + 7000;
        $data['jsapi_ticket']= $ticket;
        $fp = fopen("../jsapi_ticket_work.json", "w");
        fwrite($fp, json_encode($data));
        fclose($fp);
      }
    } else {
      $ticket = $data->jsapi_ticket;
    }

    return $ticket;
  }

  public function getAccessToken() {
    // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
    $data = json_decode(file_get_contents("../access_token_work.json"), true);
    $expire_time = !empty($data->expire_time) ? $data->expire_time : 0;
    if ($expire_time < time()) {
      $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->corpId&corpsecret=$this->corpSecret";
      $res = json_decode(\http_get($url), true);
      $access_token = $res['access_token'];
      if ($access_token) {
        $data['expire_time'] = time() + 7000;
        $data['access_token'] = $access_token;
        $fp = fopen("../access_token_work.json", "w");
        fwrite($fp, json_encode($data));
        fclose($fp);
      }
    } else {
      $access_token = $data->access_token;
    }
    return $access_token;
  }

}
