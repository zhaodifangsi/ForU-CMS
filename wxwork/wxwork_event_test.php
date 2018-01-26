<?php
include 'config/wxwork.php';
include_once "library/crypt/cls.msgcrypt.php";

class Api extends BaseController
{

  private $encoding_aes_key;
  private $token;
  private $corp_id;
  private $suite_id; //所有应用套件的应用id , 数据类型是array
  private $wxcpt;

  public function _initialize()
  {
    header("Content-Type:text/html; charset=utf-8");
    $this->corp_id = '你的corpid';
    $this->suite_id     = array(
        'suiteid'=>array('suiteid'=>,'suite_token'=>,'suite_encoding_aes_key'=>,),
        'suiteid'=>array('suiteid'=>,'suite_token'=>,'suite_encoding_aes_key'=>,),
        );//我是从数据库取的 ,这里只是一个示例
  }

  public function index()
  {

    $get    = I("get.");
    $msg_sig  = $get['msg_signature'];
    $time_stamp = $get['timestamp'];
    $nonce    = $get['nonce'];
    $corpid   = $get['corpid'];

    if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($get['echostr'])) {

      $sVerifyEchoStr = $get['echostr']; //单独获取校验echostr
      $sEchoStr     = "";
      foreach($this->suite_id as $k=>$v){
        $this->encoding_aes_key = $v['suite_encoding_aes_key'];
        $this->token = $v['suite_token'];
        $this->wxcpt = new \WXBizMsgCrypt($this->token, $this->encoding_aes_key, $this->corp_id);
        $err_code     = $this->wxcpt->VerifyURL($msg_sig, $time_stamp, $nonce, $sVerifyEchoStr, $sEchoStr);

        if ($err_code == 0) {
          echo $sEchoStr;
          exit;
        }
      }

    }
    else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      // post请求的密文数据
      // $sReqData = HttpUtils.PostData();
      $sReqData = file_get_contents("php://input"); //必须通过输入流方式获取post数据, 数据头为{"Content-Type":"application/xml"}
      $xml     = new \DOMDocument();
      $xml->loadXML($sReqData);
      $ToUserName  = $xml->getElementsByTagName('ToUserName')->item(0)->nodeValue;
      $ToUserNameType = '';
      $sassInfo = array();

      foreach($this->suite_id as $k => $v){
        if($v['suite_id'] == $ToUserName){
          $sassInfo = $v;
          $ToUserNameType = 'sutieid';
          break;
        }
      }
      //如果以上for循环不能得到套件结果, 说明不是回调接口来的请求, ToUserName对应的肯定是一个普通企业的corpid, 这时还要通过Agentid参数来获得
      //到底是哪个应用来的请求数据
      if(empty($sassInfo)){
        //通过corpid和Agentid反推来得到到底是哪个套件, 因为实例化解密类的时候, 需要token和encoding_aes_key
        $ToUserNameType = 'corpid';
      }

      $this->wxcpt = new \WXBizMsgCrypt($sassInfo['suite_token'], $sassInfo['suite_encoding_aes_key'], $ToUserName);
      $err_code = -1;
      $sMsg   = "";  // 解析之后的明文
      $err_code = $this->wxcpt->DecryptMsg($msg_sig, $time_stamp, $nonce, $sReqData, $sMsg);//var_dump($get,$err_code,$sMsg);//exit;
      if($err_code == 0){
        if ($ToUserNameType == 'sutieid') {
          $this->exceDec($sMsg);
        } else if ($ToUserNameType == 'corpid') {
          $this->exceDecInfo($sMsg);
        }

      }

    }
    //这种情况是在服务商辅助授权方式授权的应用, 微信没有回调, 只会在回调url里面有auth_code这个参数, 也就是临时授权码, 这样就相当于模拟了一个请求, 交给相同的方法来处理授权
    else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($get['auth_code'])) {
      $auth_code = $get['auth_code'];
      $state   = $get['state'];//var_dump($state);
      $suite_id  = '';//解密$state获得suiteid, 我在授权请求的state参数, 把suiteid加密了
      $time    = time();
      $sMsg    = <<<EOD
<xml>
  <SuiteId><![CDATA[$suite_id]]></SuiteId>
  <AuthCode><![CDATA[$auth_code]]></AuthCode>
  <InfoType><![CDATA[create_auth]]></InfoType>
  <TimeStamp>$time</TimeStamp>
</xml>
EOD;

      $this->exceDec($sMsg, 'server');
    }
    else {
      LogException::write("otherrequest\n\n");
    }
  }


  /**
   * 解析内容, 第三方企业号专用
   */
  public function exceDec($sMsg, $type = 'online')
  {
    $xml     = new \DOMDocument();
    $xml->loadXML($sMsg);
    $suite_id  = $xml->getElementsByTagName('SuiteId')->item(0)->nodeValue;
    $info_type = $xml->getElementsByTagName('InfoType')->item(0)->nodeValue;
    $echoStr = 'success';
    $global_options = get_option('ft_global_options');
    switch ($info_type) {
      case 'suite_ticket'://推送suite_ticket协议每十分钟微信推送一次
        $suite_ticket = $xml->getElementsByTagName('SuiteTicket')->item(0)->nodeValue;

        if (!empty($suite_ticket)) {//echo $suite_ticket;exit;
          //存suite_ticket
        }
        else {
          //错误信息
        }

        break;
      case 'change_auth'://变更授权的通知 需要调用 获取企业号的授权信息, 更改企业号授权信息
        $auth_corp_id = $xml->getElementsByTagName('AuthCorpId')->item(0)->nodeValue;//普通企业的corpid
        //业务需求
        break;
      case 'cancel_auth'://取消授权的通知 -- 特指套件取消授权
        $auth_corp_id = $xml->getElementsByTagName('AuthCorpId')->item(0)->nodeValue;//普通企业的corpid
        //自己的业务需求
        break;
      case 'create_auth'://授权成功推送auth_code事件
        //获取AuthCode
        $auth_code  = $xml->getElementsByTagName('AuthCode')->item(0)->nodeValue;
        if (!empty($auth_code)) {

          //服务商辅助授权方式安装应用
          if ('online' !== $type && 'server' === $type) {

          }
          //线上自助授权安装应用
          else if ('online' == $type) {

          }



        }
        break;
      default:
        break;
    }
    echo $echoStr;
  }


  /**
   * 解析事件推送和普通消息推送
   * @param String(xml) $sMsg
   */
  public function exceDecInfo($sMsg)
  {
    $xml     = new \DOMDocument();
    $xml->loadXML($sMsg);
    $toUserName = $corpid = $xml->getElementsByTagName('ToUserName')->item(0)->nodeValue;
    $fromUserName = $userid = $xml->getElementsByTagName('FromUserName')->item(0)->nodeValue;
    $msgType = $xml->getElementsByTagName('MsgType')->item(0)->nodeValue;
    $agentID = $xml->getElementsByTagName('AgentID')->item(0)->nodeValue;

    //TODO
    $data = array(
      'corpid'=>$corpid,
      'userid'=>$userid,
      'msgType'=>$msgType,
      'agentid'=>$agentID,
    );

  }

}
