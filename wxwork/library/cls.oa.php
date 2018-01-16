<?php
namespace Wxwork;
class OA extends Base {
  public function __construct() {}

  // 获取打卡规则
  // $data = {"datetime": 1511971200, "useridlist": ["james","paul"] }
  // 用户列表不超过100个，若用户超过100个，请分批获取。
  // 用户在不同日期的规则不一定相同，请按天获取。
  public function getCheckinRule($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/checkin/getcheckinoption?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }

  // 获取打卡数据
  // $data = {"opencheckindatatype": 3, "starttime": 1492617600, "endtime": 1492790400, "useridlist": ["james","paul"] }
  // 获取记录时间跨度不超过三个月
  // 用户列表不超过100个。若用户超过100个，请分批获取
  // 有打卡记录即可获取打卡数据，与当前”打卡应用”是否开启无关
  public function getCheckinData($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/checkin/getcheckindata?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }

  // 获取审批数据
  // $data = {"starttime":  1492617600, "endtime":    1492790400, "next_spnum": 201704200003 }
  public function getApprovalData($data){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/corp/getapprovaldata?access_token=$access_token";
    return json_decode(\https_post($url, $data));
  }
}
