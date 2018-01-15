<?php
//返回当前的脚本名
function self_name() {
  return ltrim(strrchr($_SERVER['PHP_SELF'], "/"),"/");
}
// 获取后缀名
function get_file_ext($s) {
  return ltrim(strrchr($s, "."), ".");
}
// 获取文件名
function get_file_name($s) {
  return strstr($s, ".", true);
}

// 替换默认图片
function img_always($s) {
  if (!empty($s)) {
    return $s;
  } else {
    return 'uploadfile/pic.jpg';
  }
}

// 判断目录是否存在不存在则创建
function mk_dir($dir, $mode = 0777)
{
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mk_dir(dirname($dir), $mode)) return FALSE;
    return @mkdir($dir, $mode);
}