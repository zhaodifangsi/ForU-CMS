<?php
/**
 * 签名助手 2017/11/19
 *
 * Class SignatureHelper
 */
class Alisms {

  /**
   * 生成签名并发起请求
   *
   * @param $accessKeyId string AccessKeyId (https://ak-console.aliyun.com/)
   * @param $accessKeySecret string AccessKeySecret
   * @param $domain string API接口所在域名
   * @param $params array API具体参数
   * @return bool|\stdClass 返回API接口调用结果，当发生错误时返回false
   */
  public function send($phoneNumbers, $templateCode='', $signName='', $templateParam='') {

    $params = array ();

    // *** 需用户填写部分 ***

    // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
    $accessKeyId = ALISMS_KEY_ID;
    $accessKeySecret = ALISMS_KEY_SECRET;

    // fixme 必填: 短信接收号码
    $params["PhoneNumbers"] = $phoneNumbers;

    // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
    $params["SignName"] = !empty($signName) ? $signName : ALISMS_SIGNNAME;

    // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
    $params["TemplateCode"] = !empty($templateCode) ? $templateCode : ALISMS_TEMPLATE_CODE;

    // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
    // $params['TemplateParam'] = Array ("code" => "12345", "product" => "阿里通信");
    if (!empty($templateParam)) $params['TemplateParam'] = $templateParam;

    // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
    if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
      $params["TemplateParam"] = json_encode($params["TemplateParam"]);
    }

    // 初始化SignatureHelper实例用于设置参数，签名以及发送请求
    // 此处可能会抛出异常，注意catch
    $content = $this->request(
      $accessKeyId,
      $accessKeySecret,
      "dysmsapi.aliyuncs.com",
      array_merge($params, array(
        "RegionId" => "cn-hangzhou",
        "Action" => "SendSms",
        "Version" => "2017-05-25",
      ))
    );
    return $content;
  }

  public function request($accessKeyId, $accessKeySecret, $domain, $params) {
    $apiParams = array_merge(array (
      "SignatureMethod" => "HMAC-SHA1",
      "SignatureNonce" => uniqid(mt_rand(0,0xffff), true),
      "SignatureVersion" => "1.0",
      "AccessKeyId" => $accessKeyId,
      "Timestamp" => gmdate("Y-m-d\TH:i:s\Z"),
      "Format" => "JSON",
    ), $params);
    ksort($apiParams);

    $sortedQueryStringTmp = "";
    foreach ($apiParams as $key => $value) {
      $sortedQueryStringTmp .= "&" . $this->encode($key) . "=" . $this->encode($value);
    }

    $stringToSign = "GET&%2F&" . $this->encode(substr($sortedQueryStringTmp, 1));

    $sign = base64_encode(hash_hmac("sha1", $stringToSign, $accessKeySecret . "&",true));

    $signature = $this->encode($sign);

    $url = "http://{$domain}/?Signature={$signature}{$sortedQueryStringTmp}";

    try {
      $content = $this->fetchContent($url);
      return json_decode($content);
    } catch( \Exception $e) {
      return false;
    }
  }

  private function encode($str)
  {
    $res = urlencode($str);
    $res = preg_replace("/\+/", "%20", $res);
    $res = preg_replace("/\*/", "%2A", $res);
    $res = preg_replace("/%7E/", "~", $res);
    return $res;
  }

  private function fetchContent($url) {
    if(function_exists("curl_init")) {
      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_TIMEOUT, 5);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        "x-sdk-client" => "php/2.0.0"
      ));
      $rtn = curl_exec($ch);

      if($rtn === false) {
        trigger_error("[CURL_" . curl_errno($ch) . "]: " . curl_error($ch), E_USER_ERROR);
      }
      curl_close($ch);

      return $rtn;
    }

    $context = stream_context_create(array(
      "http" => array(
        "method" => "GET",
        "header" => array("x-sdk-client: php/2.0.0"),
      )
    ));

    return file_get_contents($url, false, $context);
  }
}
