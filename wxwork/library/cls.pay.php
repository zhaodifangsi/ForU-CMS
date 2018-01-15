<?php
namespace Wxwork;
class Pay extends Base {
  /* 企业红包 */
  // 发放企业红包
  // $data = '<xml> <nonce_str>5K8264ILTKCH16CQ2502SI8ZNMTM67VS</nonce_str> <sign>C380BEC2BFD727A4B6845133519F3AD6</sign> <mch_billno>123456</mch_billno> <mch_id>10000098</mch_id> <wxappid>wx8888888888888888</wxappid> <sender_name>XX活动</sender_name> <sender_header_media_id>1G6nrLmr5EC3MMb_-zK1dDdzmd0p7cNliYu9V5w7o8K0</sender_header_media_id> <re_openid>oxTWIuGaIt6gTKsQRLau2M0yL16E</re_openid> <total_amount>1000</total_amount> <wishing>感谢您参加猜灯谜活动，祝您元宵节快乐！</wishing> <act_name>猜灯谜抢红包活动</act_name> <remark>猜越多得越多，快来抢！</remark> <workwx_sign>99BCDAFF065A4B95628E3DB468A874A8</workwx_sign> </xml>';
  // 用户列表不超过100个，若用户超过100个，请分批获取。
  // 用户在不同日期的规则不一定相同，请按天获取。
  public function sendWorkRedPack($data){
    $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendworkwxredpack";
    return json_decode(\https_post($url, $data));
  }

  // 查询红包记录
  // $data = '<xml> <nonce_str>5K8264ILTKCH16CQ2502SI8ZNMTM67VS</nonce_str> <sign>C380BEC2BFD727A4B6845133519F3AD6</sign> <mch_billno>123456</mch_billno> <mch_id>10000098</mch_id> <appid>wx8888888888888888</appid> </xml>';
  public function getWorkRedPack($data){
    $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/queryworkwxredpack";
    return json_decode(\https_post($url, $data));
  }

  /* 向员工付款 */
  // 向员工付款
  // $data = '<xml> <appid>wxe062425f740c30d8</appid> <mch_id>1900000109</mch_id> <device_info>013467007045764</device_info> <nonce_str>3PG2J4ILTKCH16CQ2502SI8ZNMTM67VS</nonce_str> <sign>C97BDBACF37622775366F38B629F45E3</sign> <partner_trade_no>100000982017072019616</partner_trade_no> <openid>ohO4Gt7wVPxIT1A9GjFaMYMiZY1s</openid> <check_name>NO_CHECK</check_name> <re_user_name>张三</re_user_name> <amount>100</amount> <desc>六月出差报销费用</desc> <spbill_create_ip>10.2.3.10</spbill_create_ip> <workwx_sign>99BCDAFF065A4B95628E3DB468A874A8</workwx_sign> <ww_msg_type>NORMAL_MSG</ww_msg_type> <act_name>示例项目</act_name> </xml>';
  // 给同一个实名用户付款，单笔单日限额2W/2W
  // 不支持给非实名用户打款
  // 一个商户同一日付款总额限额100W
  // 单笔最小金额默认为1元
  // 每个用户每天最多可付款10次，可以在商户平台—API安全进行设置
  // 给同一个用户付款时间间隔不得低于15秒
  public function payWorker($data){
    $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/paywwsptrans2pocket";
    return json_decode(\https_post($url, $data));
  }

  // 查询付款记录
  // $data = '<xml> <sign><![CDATA[E1EE61A91C8E90F299DE6AE075D60A2D]]></sign> <partner_trade_no><![CDATA[0010010404201411170000046545]]></partner_trade_no> <mch_id ><![CDATA[10000097]]></mch_id > <appid><![CDATA[wxe062425f740c30d8]]></appid> <nonce_str><![CDATA[50780e0cca98c8c8e814883e5caa672e]]></nonce_str> </xml>';
  public function queryPayWorker($data){
    $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/querywwsptrans2pocket";
    return json_decode(\https_post($url, $data));
  }

  // 获取签名
  // $str="act_name=XXX&mch_billno=11111234567890&mch_id=10000098&nonce_str=qFKEgfig76DF9912fewmkp&re_openid=oxTWIuGaIt6gTKsQRLau2M0yL16E&total_amount=100&wxappid=wx123456789";
  // 对参数按照key=value的格式，并按照参数名ASCII字典序排序
  // 拼接企业微信支付应用secret
  public function getSign($str) {
    $signTemp = $str."&secret=".WXPAY_SECRET;
    return MD5($signTemp).toUpperCase();
  }
}
