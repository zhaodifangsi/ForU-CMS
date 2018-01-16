<?php
namespace Wxwork;
class Msg extends Base {
  public function __construct() {}

  // 查询电子发票
  // $data = '{"card_id":"发票ID" , "encrypt_code":"ENCRYPTCODE"}';
  public function getInfo($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/card/invoice/reimburse/getinvoiceinfo?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }

  // 更新发票状态
  // $data = '{"card_id":"发票ID" , "encrypt_code":"ENCRYPTCODE", "reimburse_status":"INVOICE_REIMBURSE_INIT"}';
  // 发报销状态 INVOICE_REIMBURSE_INIT：发票初始状态，未锁定；INVOICE_REIMBURSE_LOCK：发票已锁定，无法重复提交报销;INVOICE_REIMBURSE_CLOSURE:发票已核销，从用户卡包中移除
  public function updateStatus($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/card/invoice/reimburse/updateinvoicestatus?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }

  // 更新发票状态
  /*
  $data = '{
    "openid":"OPENID" ,
    "reimburse_status":"INVOICE_REIMBURSE_INIT",
    "invoice_list":
    [
      {"card_id":"cardid_1","encrypt_code":"encrypt_code_1"},
      {"card_id":"cardid_2","encrypt_code":"encrypt_code_2"}
    ]
  }';
  */
  // 仅认证的企业微信账号有接口权限
  public function updateStatusBatch($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/card/invoice/reimburse/updatestatusbatch?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }

  // 批量查询电子发票
  /*
  $data = '{
    "item_list": [
      {
        "card_id":"CARDID1" ,
        "encrypt_code":"ENCRYPTCODE1"
      },
      {
        "card_id":"CARDID2" ,
        "encrypt_code":"ENCRYPTCODE2"
      }
    ]
  }';
  */
  // 仅认证的企业微信账号有接口权限
  public function getInfoBatch($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/card/invoice/reimburse/getinvoiceinfobatch?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }
}
