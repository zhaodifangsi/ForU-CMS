<?php
include_once 'conf.php';
include_once '../library/inc.php';

if ($act == 'getCol') {
  $id = str_safe($_GET['id']);
  $tbl = str_safe($_GET['tbl']);
  $col = str_safe($_GET['col']);
  $size = !empty($_GET['size']) ? str_safe($_GET['size']) : 0;

  if ($res['ex'] = $db->getOne("SELECT $col FROM $tbl WHERE id = $id")) {
    $res['ex'] = $size ? str_cut(str_text($res['ex']), $size) : $res['ex'];
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'getRow') {
  $id = str_safe($_GET['id']);
  $tbl = str_safe($_GET['tbl']);

  if ($res = $db->getRow("SELECT * FROM $tbl WHERE id = $id")) {
    if ($tbl == 'detail') $res['ex'] = transData($res);
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'getList') {
  $id = str_safe($_GET['id']);
  $sub = get_channel($id, 'c_sub');
  $size = !empty($_GET['size']) ? str_safe($_GET['size']) : 0;

  include_once '../library/cls.page.php';
  if ($size) {
    $page = new Page($size);
  } else {
    $page = new Page(20);
  }

  $page->handle($db->getOne("SELECT COUNT(*) FROM detail WHERE d_parent IN ($sub)"));
  $res['totalPage'] = $page->page_sum;

  if ($res['ex'] = $db->getAll("SELECT id,d_name,d_tag,d_price,d_ifpicture,d_picture,d_ifslideshow,d_slideshow,d_scontent,d_content,d_code,d_date FROM detail WHERE d_parent IN ($sub) ORDER BY d_order ASC, id DESC LIMIT ".$page->page_start.",".$page->page_size)) {
    $res['ex'] = transData($res['ex']);
    foreach($res['ex'] as $key=>$val) {
      list($res['ex'][$key]['cprice'],$res['ex'][$key]['oprice']) = explode('|', $val['d_price']);
      $res['ex'][$key]['colors'] = $db->getAll("SELECT c_color FROM detail_color WHERE d_id = ".$val['id']);
      $res['ex'][$key]['colorTotal'] = count($res['ex'][$key]['colors']);
    }
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'getList') {
  $id = str_safe($_GET['id']);
  $sub = get_channel($id, 'c_sub');
  $size = !empty($_GET['size']) ? str_safe($_GET['size']) : 0;

  include_once '../library/cls.page.php';
  if ($size) {
    $page = new Page($size);
  } else {
    $page = new Page(20);
  }

  $page->handle($db->getOne("SELECT COUNT(*) FROM detail WHERE d_parent IN ($sub)"));
  $res['totalPage'] = $page->page_sum;

  if ($res['ex'] = $db->getAll("SELECT * FROM detail WHERE d_parent IN ($sub) ORDER BY d_order ASC, id DESC LIMIT ".$page->page_start.",".$page->page_size)) {
    $res['ex'] = transData($res['ex']);
    foreach($res['ex'] as $key=>$val) {
      if (isset($val['d_price'])) list($res['ex'][$key]['cprice'],$res['ex'][$key]['oprice']) = explode('|', $val['d_price']);
      $res['ex'][$key]['colors'] = $db->getAll("SELECT c_color FROM detail_color WHERE d_id = ".$val['id']);
      $res['ex'][$key]['colorTotal'] = count($res['ex'][$key]['colors']);
    }
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

elseif ($act == 'getSlider') {
  if ($res['ex'] = $db->getAll("SELECT s_picture FROM slideshow WHERE s_parent = 'mobile' ORDER BY s_order ASC")) {
    foreach ($res['ex'] as $key => $value) {
      $res['ex'][$key]['s_picture'] = transPicture($value['s_picture']);
    }
    $res['err'] = 0;
    $res['msg'] = 'success';
  } else {
    $res['err'] = 50010;
    $res['msg'] = 'Data error';
  }
}

else {
  $res['err'] = 1;
  $res['msg'] = 'Illegal access';
}

die(json_encode($res));

function transData($d) {
  if (@$d['d_ifpicture']) {
    $d['date'] = local_date('Y-m-d', $d['d_date']);
    if ($d['d_ifpicture']) $d['picture'] = transPicture($d['d_picture']);
    if ($d['d_ifslideshow']) $d['slideshow'] = transPicture($d['d_slideshow']);
    if ($d['d_ifslideshow']) $d['slideshow'] = transPicture($d['d_slideshow']);
    $d['content'] = transPicture($d['d_content']);
  } else {
    foreach ($d as $key=>$val) {
      $d[$key]['date'] = local_date('Y-m-d', $val['d_date']);
      if ($d[$key]['d_ifpicture']) $d[$key]['picture'] = transPicture($val['d_picture']);
      $d[$key]['slideshow'] = @$d[$key]['d_ifslideshow'] ? transPicture($val['d_slideshow']) : '';
      $d[$key]['content'] = @$val['d_content'] ? transPicture($val['d_content']) : '';
    }
  }
  return $d;
}

function transPicture($v) {
  $str = SERVER_URL.'/uploadfile';
  if (strpos($v, '/mcmswx/editor/php/../../uploadfile')!==false) {
    $res = str_replace('/mcmswx/editor/php/../../uploadfile', $str, $v);
  } elseif (strpos($v, '/mcmswx/uploadfile')!==false) {
    $res = str_replace('/mcmswx/uploadfile', $str, $v);
  } elseif (strpos($v, '/mcms/uploadfile')!==false) {
    $res = str_replace('/mcms/uploadfile', $str, $v);
  } elseif (strpos($v, '/uploadfile')!==false) {
    $res = str_replace('/uploadfile', $str, $v);
  } elseif (strpos($v, 'uploadfile')!==false) {
    $res = str_replace('uploadfile', $str, $v);
  } else {
    $res = $v;
  }
  return $res;
}
