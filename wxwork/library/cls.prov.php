<?php
namespace Wxwork;
class Provider extends Base {
  public function __construct() {}

  // 发送消息
  public function getProvToken(){
    $json = json_decode(file_get_contents("../provider_access_token.json"));
    $expires_in = !empty($json->expires_in) ? $json->expires_in : 0;
    if ($expires_in < time()) {
      $url = "https://qyapi.weixin.qq.com/cgi-bin/service/get_provider_token";
      $data = '{"corpid":"'.CORPID.'", "provider_secret":"'.PROVSECRET.'"}';
      $res = json_decode(\https_post($url, $data));
      $access_token = $res->provider_access_token;
      if ($access_token) {
        $arr['expires_in'] = time() + 7000;
        $arr['provider_access_token'] = $access_token;
        $fp = fopen("../provider_access_token.json", "w");
        fwrite($fp, json_encode($arr));
        fclose($fp);
      }
    } else {
      $access_token = $json->provider_access_token;
    }
    return $access_token;
  }
}
