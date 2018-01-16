<?php
namespace Wxwork;
class Oauth extends Base {
  public function __construct() {}

  // 获取code
  // scope:['snsapi_base','snsapi_userinfo','snsapi_privateinfo']
  // 静默授权，可获取成员的基本信息;静默授权，可获取成员的敏感信息，但不包含手机、邮箱；手动授权，可获取成员的敏感信息，包含手机、邮箱
  public function getCode($redirect_uri,$scope='snsapi',$agent_id='',$state='') {
    if (empty($_COOKIE['cms']['user_info'])) {
      $access_token = $this->getAccessToken();
      switch ($scope) {
        case 'snsapi_base':
          $scopeStr = "&scope=$scope";
          break;

        default:
          $scopeStr = "&scope=$scope&agentid=$agent_id";
          break;
      }
      $stateStr = !empty($state) ? "&state=$state" : "";
      $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$corpId&redirect_uri=$redirect_uri&response_type=code{$scopeStr}{$stateStr}#wechat_redirect";
      return $url;
    } else {
      href($redirect_uri);
    }
  }

  public function getUserTicket() {
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=$access_token&code=".$_GET['code'];
    $res = json_decode(\https_get($url));
    if ($res['errcode']==0) {
      if (isset($res['UserId'])) {
        return $res;
      } else {
        $res['msg'] = '非企业成员的标识，对当前企业唯一';
        return $res;
      }
    } else {
      var_dump($res);exit;
    }
  }

  public function getUserInfo($user_ticket) {
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserdetail?access_token=$access_token";
    $data = '{"user_ticket": "'.$user_ticket.'"}';
    $res = \https_post($url, $data);

    setcookie('cms[user_info]', $res['userid'], time()+COOKIE_EXPIRE);
    return json_decode($res);
  }
}
