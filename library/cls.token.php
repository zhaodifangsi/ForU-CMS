<?php
// check_token($data) 函数位于libraray.php中
class Token {
  public function setToken(){
    if(TOKEN_ON) {
      list($tokenName, $tokenKey, $tokenValue) = $this->getToken();
      return '<input type="hidden" name="'.$tokenName.'" value="'.$tokenKey.'_'.$tokenValue.'" />';
    }
  }

  public function getToken(){
    $tokenName = TOKEN_NAME;
    if(!isset($_SESSION[$tokenName])) {
      $_SESSION[$tokenName] = array();
    }
    // 标识当前页面唯一性
    $tokenKey = md5($_SERVER['REQUEST_URI']);
    if(isset($_SESSION[$tokenName][$tokenKey])) {// 相同页面不重复生成session
      $tokenValue = $_SESSION[$tokenName][$tokenKey];
    } else {
      $tokenValue = md5(microtime(TRUE));
      $_SESSION[$tokenName][$tokenKey] = $tokenValue;
      if(IS_AJAX && cms('TOKEN_RESET',null,true))
        header($tokenName.': '.$tokenKey.'_'.$tokenValue); //ajax需要获得这个header并替换页面中meta中的token值
    }
    return array($tokenName,$tokenKey,$tokenValue);
  }
}