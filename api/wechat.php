<?php
include_once 'conf.php';
include '../library/inc.php';

$wechat = new Wechat();
$wechat->checkToken();

if ($act == 'sendMsgPay') {
  $u_id = str_safe($_GET['u_id']);
  $touser = str_safe($_GET['open_id']);
  $page = $_GET['page'] ? str_safe($_GET['page']) : "index"
  $prepay_id = str_safe($_GET['prepay_id']);
  $arr_order = $db->getRow("SELECT o.* g.d_name FROM order AS o INNER JOIN goods AS g ON g.id = o.g_id WHERE o.u_id = $u_id ORDER by o.id DESC");
  $value1 = $arr_order['o_sn'];
  $value2 = $arr_order['d_name'];
  $value3 = $arr_order['o_cost'];
  $value4 = local_date('Y/m/d', $arr_order['o_date']);

  $arr['touser'] = $touser;
  $arr['template_id'] = MINIP_TEMPLATE_ID_PAY;
  $arr['page'] = $page;
  $arr['form_id'] = $prepay_id;
  $arr['data'] = array(
    'keyword1'=>array('value'=>$value1),
    'keyword2'=>array('value'=>$value2),
    'keyword3'=>array('value'=>$value3),
    'keyword4'=>array('value'=>$value4)
    );
  $res = $wechat->sendTemplateMsg($arr);
}

die(json_encode($res));

class Wechat {
  public $access_token;
  public $token_file = 'access_token.txt';

  public function checkToken() {
    // 读取文件
    if (file_exists($this->token_file)) {
      $arr_token = json_decode(file_get_contents($this->token_file),true);
      if (time() > $arr_token['end_time']) {
        $arr = $this->getAccessToken();
        $this->updateFile($arr);
      } else {
        $this->access_token = $arr_token['access_token'];
      }
    } else {
      $arr = $this->getAccessToken();
      $this->updateFile($arr);
    }
    return $this->access_token;
  }

  // 发送模板消息
  public function sendTemplateMsg($arr) {
    $arr = json_decode(https_post('https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$this->access_token, json_encode($arr)), true);
    return $arr;
  }

  public function getAccessToken() {
    $res = json_decode(https_get('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.APP_ID.'&secret='.APP_SECRET), true);
    $this->access_token = $res['access_token'];
    $res['end_time'] = time()+MP_ETIME;
    return $res;
  }

  private function updateFile($arr) {
    // 写入文件
    $file = fopen($this->token_file,'w') or die("Unable to open $this->token_file!");
    fwrite($file, json_encode($arr));
    fclose($file);
    return ;
  }
}
