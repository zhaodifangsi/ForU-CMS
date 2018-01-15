<?php
//验证码类
class VerifyCode {
  private $charset = 'abcdefghkmnprstuvwxyzABCDEFGHKMNPRSTUVWXYZ23456789';
  //随机因子
  private $code;
  //验证码
  private $codelen;
  //验证码长度
  private $width;
  //宽度
  private $height;
  //高度
  private $img;
  //图形资源句柄
  private $font;
  //指定的字体
  private $fontsize;
  //指定字体大小
  private $fontcolor;
  //指定字体颜色
  private $state;
  //构造方法初始化
  public function __construct($w, $h, $fs = 24, $cl = 4) {
    if (checkGD()) {
      $this->width = $w;
      $this->height = $h;
      $this->fontsize = $fs;
      $this->codelen = $cl;
      $this->font = ROOT_PATH . FONT_DIR . '/elephant.ttf';
      $this->state = true;
    } else {
      $this->state = false;
    }
  }
  //生成随机码
  private function createCode() {
    if ($this->state) {
      $_len = strlen($this->charset) - 1;
      for ($i = 0; $i < $this->codelen; $i++) {
        $this->code .= $this->charset[mt_rand(0, $_len)];
      }
    } else {
      $file = scandir(LIB_PATH . 'verifycode/');
      foreach ($file as $val) {
        if ($val!='.' && $val!='..') {
          $filename = explode('.', $val);
          $arr[] = $filename[0];
        }
      }
      shuffle($arr);
      $res = array_slice($arr, 0, 1);
      $this->code = $res[0];
    }
  }
  //生成背景
  private function createBg() {
    $this->img = imagecreatetruecolor($this->width, $this->height) or die('Cannot Initialize new GD image stream');
    // $color = imagecolorallocate($this->img, mt_rand(157,255), mt_rand(157,255), mt_rand(157,255));
    $color = imagecolorallocate($this->img, 240, 240, 240);
    imagefilledrectangle($this->img, 0, $this->height, $this->width, 0, $color);
  }
  //生成文字
  private function createFont() {
    $_x = $this->width / $this->codelen;
    for ($i = 0; $i < $this->codelen; $i++) {
      $this->fontcolor = imagecolorallocate($this->img, mt_rand(0, 156), mt_rand(0, 156), mt_rand(0, 156));
      imagettftext($this->img, $this->fontsize, mt_rand(-30, 30), $_x * $i + mt_rand(5, 10), $this->height / 1.4, $this->fontcolor, $this->font, $this->code[$i]);
    }
  }
  //生成线条、雪花
  private function createLine() {
    for ($i = 0; $i < 6; $i++) {
      $color = imagecolorallocate($this->img, mt_rand(0, 156), mt_rand(0, 156), mt_rand(0, 156));
      imageline($this->img, mt_rand(0, $this->width), mt_rand(0, $this->height), mt_rand(0, $this->width), mt_rand(0, $this->height), $color);
    }
  }
  //输出
  private function outPut() {
    header('Content-type:image/gif');
    imagegif($this->img);
    imagedestroy($this->img);
  }
  //对外生成
  public function doimg() {
    if ($this->state) {
      $this->createBg();
      $this->createCode();
      $this->createLine();
      $this->createFont();
      $this->outPut();
    } else {
      $this->createCode();
      $_SESSION['verifycode_admin'] = $_SESSION['verifycode'] = strtolower($this->code);
      return '../library/verifycode/' . $this->code . '.png';
    }
  }
  //获取验证码
  public function getCode() {
    return strtolower($this->code);
  }
}
