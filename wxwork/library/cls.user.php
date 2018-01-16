<?php
namespace Wxwork;

class User {
  public function __construct() {}

  public function userCreate($access_token) {
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/create?access_token=$access_token";
    $data = '{"userid": "zhangsan", "name": "张三", "english_name": "jackzhang", "mobile": "15913215421", "department": [1, 2], "order":[10,40], "position": "产品经理", "gender": "1", "email": "zhangsan@gzdev.com", "isleader": 1, "enable":1, "avatar_mediaid": "2-G6nrLmr5EC3MNb_-zL1dDdzkd0p7cNliYu9V5w7o8K0", "telephone": "020-123456"， "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]} }';
    $res = json_decode(\https_post($url, $data), true);
    return $res;
  }

  public function userGet($access_token, $user_id) {
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token=$access_token&userid=$user_id";
    $data = '{"userid": "zhangsan", "name": "张三", "english_name": "jackzhang", "mobile": "15913215421", "department": [1, 2], "order":[10,40], "position": "产品经理", "gender": "1", "email": "zhangsan@gzdev.com", "isleader": 1, "enable":1, "avatar_mediaid": "2-G6nrLmr5EC3MNb_-zL1dDdzkd0p7cNliYu9V5w7o8K0", "telephone": "020-123456"， "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]} }';
    $res = json_decode(\https_get($url), true);
    return $res;
  }

  public function userUpdate($access_token) {
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/update?access_token=$access_token";
    $data = '{"userid": "zhangsan", "name": "张三", "english_name": "jackzhang", "mobile": "15913215421", "department": [1, 2], "order":[10,40], "position": "产品经理", "gender": "1", "email": "zhangsan@gzdev.com", "isleader": 1, "enable":1, "avatar_mediaid": "2-G6nrLmr5EC3MNb_-zL1dDdzkd0p7cNliYu9V5w7o8K0", "telephone": "020-123456"， "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]} }';
    $res = json_decode(\https_post($url, $data), true);
    return $res;
  }

  public function userDelete($access_token, $user_id) {
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/delete?access_token=$access_token&userid=$user_id";
    $res = json_decode(\https_get($url), true);
    return $res;
  }

  public function userBatchDelete($access_token) {
    $url = "https://qyapi.weixin.qq.com/cgi-bin/user/batchdelete?access_token=$access_token";
    $data = '{"useridlist": ["zhangsan", "lisi"] }';
    $res = json_decode(\https_post($url, $data), true);
    return $res;
  }

  public function userFromDept($access_token, $dept_id, $fetch_child=1) {
    $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/simplelist?access_token=$access_token&department_id=$dept_id&fetch_child=$fetch_child';
    $res = json_decode(\https_get($url), true);
    return $res;
  }

  public function userInfoFromDept($access_token, $dept_id, $fetch_child=1) {
    $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/list?access_token=$access_token&department_id=$dept_id&fetch_child=$fetch_child';
    $res = json_decode(\https_get($url), true);
    return $res;
  }

  public function userid_openid($access_token) {
    $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/convert_to_openid?access_token=$access_token';
    $data = '{"userid": "zhangsan", "agentid": 1 }';
    $res = json_decode(\https_post($url, $data), true);
    return $res;
  }

  public function openid_userid($access_token) {
    $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/convert_to_userid?access_token=$access_token';
    $data = '{"openid": "oDOGms-6yCnGrRovBj2yHij5JL6E"}';
    $res = json_decode(\https_post($url, $data), true);
    return $res;
  }

  public function userAuthSucc($access_token, $user_id) {
    $url = 'https://qyapi.weixin.qq.com/cgi-bin/user/authsucc?access_token=$access_token&userid=$user_id';
    $res = json_decode(\https_get($url), true);
    return $res;
  }

}
