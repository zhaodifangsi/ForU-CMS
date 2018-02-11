<?php
include_once 'conf.php';
include_once '../library/inc.php';
$arr_succ = array('err'=>0,'msg'=>'success');
$arr_fail = array('err'=>50010,'msg'=>'Data error');

if ($act == 'getCol') {
  $id = str_safe($_GET['id']);
  $tbl = str_safe($_GET['tbl']);
  $col = str_safe($_GET['col']);
  $size = !empty($_GET['size']) ? str_safe($_GET['size']) : 0;

  $res = $arr_succ;
  if ($res['ex'] = $db->getOne("SELECT $col FROM $tbl WHERE id = $id")) {
    $res['ex'] = $size ? str_cut(str_text($res['ex']), $size) : $res['ex'];
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getMenu') {
  $id = str_safe($_GET['id']);

  $res = $arr_succ;
  if ($res['ex'] = $db->getAll("SELECT id,c_name FROM channel WHERE c_navigation=1 AND c_parent IN ($id)")) {
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getRow') {
  $id = str_safe($_GET['id']);
  $tbl = str_safe($_GET['tbl']);

  $res = $arr_succ;
  if ($res = $db->getRow("SELECT * FROM $tbl WHERE id = $id")) {
    if (in_array($tbl, array('detail','goods'))) $res['ex'] = transData($res);
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getRowGoods') {
  $id = str_safe($_GET['id']);

  $res = $arr_succ;
  if ($row = $db->getRow("SELECT * FROM goods WHERE id = $id")) {
    $res['ex'] = transData($row);
    $res['ex']['min_price'] = $db->getOne("SELECT MIN(ar_price) FROM goods_attr_relation WHERE ar_price >0");
    $arr_rel = $db->getAll("SELECT * FROM goods_attr_relation WHERE g_id = $id");
    foreach ($arr_rel as $key => $value) {
      // { priceId: 1, price: 35.0, "stock": 8, "attrValueList": [ { "attrKey": "型号", "attrValue": "2" }, { "attrKey": "颜色", "attrValue": "白色" }, { "attrKey": "大小", "attrValue": "小" }, { "attrKey": "尺寸", "attrValue": "1m" } ] }
      $res['prop'][$key]['priceId'] = $value['id'];
      $res['prop'][$key]['price'] = $value['ar_price'];
      $res['prop'][$key]['stock'] = $value['ar_quantity'];
      $res['prop'][$key]['names'] = getAttrValue($value['av_ids'],'name');
      $res['prop'][$key]['stock'] = $value['ar_quantity'];
      $arr_a_ids = explode(',', $value['a_ids']);
      $arr_av_ids = explode(',', $value['av_ids']);
      foreach ($arr_a_ids as $k => $v) {
        $arr_temp = array();
        $arr_temp['attrKey'] = $db->getOne("SELECT a_name FROM goods_attr WHERE id = '$v'");
        $arr_temp['attrValue'] = $db->getOne("SELECT av_name FROM goods_attr_value WHERE id = '".$arr_av_ids[$k]."'");
        $arr_temp['selectedValue'] = $arr_av_ids[$k];
        $res['prop'][$key]['attrValueList'][] = $arr_temp;
      }
    }
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getListGoods') {
  // 获取商品列表
  $id = str_safe($_GET['id']);
  $sub = get_channel($id, 'c_sub');
  $size = !empty($_GET['size']) ? str_safe($_GET['size']) : 0;
  $where = !empty($_GET['keyword']) ? "AND d_name LIKE '%".str_safe($_GET['keyword'])."%'" : "";

  include_once '../library/cls.page.php';
  if ($size) {
    $page = new Page($size);
  } else {
    $page = new Page(20);
  }

  $page->handle($db->getOne("SELECT COUNT(*) FROM goods WHERE d_parent IN ($sub) AND d_state=6 AND d_date<='".gmtime()."' $where"));

  $res = $arr_succ;
  $res['totalPage'] = $page->page_sum;
  if ($row = $db->getAll("SELECT id,d_name,d_price,d_ifpicture,d_picture,d_tag FROM goods WHERE d_parent IN ($sub) AND d_state=6 AND d_date<='".gmtime()."' $where ORDER BY d_order ASC, id DESC LIMIT ".$page->page_start.",".$page->page_size)) {
    foreach ($row as $key=>$val) {
      $row[$key]['d_tags'] = explode(',', $val['d_tag']);
      $row[$key]['min_price'] = $db->getOne("SELECT MIN(ar_price) FROM goods_attr_relation WHERE ar_price >0 AND g_id = '".$val['id']."'");
    }
    $res['ex'] = transData($row);
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getListDetail') {
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

  $res = $arr_succ;
  $res['totalPage'] = $page->page_sum;
  if ($res['ex'] = $db->getAll("SELECT * FROM detail WHERE d_parent IN ($sub) ORDER BY d_order ASC, id DESC LIMIT ".$page->page_start.",".$page->page_size)) {
    $res['ex'] = transData($res['ex']);
    foreach($res['ex'] as $key=>$val) {
      if (isset($val['d_price'])) list($res['ex'][$key]['cprice'],$res['ex'][$key]['oprice']) = explode('|', $val['d_price']);
      $res['ex'][$key]['colors'] = $db->getAll("SELECT c_color FROM detail_color WHERE d_id = ".$val['id']);
      $res['ex'][$key]['colorTotal'] = count($res['ex'][$key]['colors']);
    }
  } else {
    $res = $arr_fail;
  }
}

elseif ($act == 'getSlider') {
  $res = $arr_succ;
  $id = !empty($_GET['id']) ? str_safe($_GET['id']) : 0;
  if ($id) {
    $res['ex'] = $db->getAll("SELECT s_picture FROM slideshow WHERE s_parent = '$id' ORDER BY s_order ASC");
  } else {
    $res['ex'] = $db->getAll("SELECT s_picture FROM slideshow WHERE s_parent = 'mobile' ORDER BY s_order ASC");
  }
  if ($row = $res['ex']) {
    foreach ($row as $key => $value) {
      $res['ex'][$key]['s_picture'] = transPicture($value['s_picture']);
    }
  } else {
    $res = $arr_fail;
  }
}

else {
  $res['err'] = 1;
  $res['msg'] = 'Illegal access';
}

die(json_encode($res));

function getAttrValue($str_ids, $type=''){
  $arr_ids = explode(',', $str_ids);
  foreach ($arr_ids as $value) {
    $res[] = $GLOBALS['db']->getOne("SELECT ".($type == 'name' ? 'av_name' : 'id')." FROM goods_attr_value WHERE ".($type == 'name' ? 'id' : 'av_name')." = '$value'");
  }
  return implode(',', $res);
}

function transData($d) {
  if (@$d['d_ifpicture']) {
    $d['date'] = local_date('Y-m-d', $d['d_date']);
    if ($d['d_ifpicture']) $d['picture'] = transPicture($d['d_picture']);
    if ($d['d_ifslideshow']) $d['slideshow'] = transPicture($d['d_slideshow']);
    if ($d['d_ifslideshow']) $d['slideshow'] = transPicture($d['d_slideshow']);
    $d['content'] = transPicture($d['d_content']);
  } else {
    foreach ($d as $key=>$val) {
      if (@$d[$key]['d_date']) $d[$key]['date'] = local_date('Y-m-d', $val['d_date']);
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
  } elseif (strpos($v, '/lolly/uploadfile')!==false) {
    $res = str_replace('/lolly/uploadfile', $str, $v);
  } elseif (strpos($v, '/uploadfile')!==false) {
    $res = str_replace('/uploadfile', $str, $v);
  } elseif (strpos($v, 'uploadfile')!==false) {
    $res = str_replace('uploadfile', $str, $v);
  } else {
    $res = $v;
  }
  return $res;
}

function transProp($did) {
  $res = $GLOBALS['db']->getAll("SELECT id,parent_id,p_name FROM prop WHERE d_id = $did ORDER BY id ASC");
  $arr_prop_main_ids = $GLOBALS['db']->getAll("SELECT id FROM prop WHERE d_id = $did");
  foreach($arr_prop_main_ids as $key=>$val) {
    $res[$key]['sub'] = $GLOBALS['db']->getAll("SELECT id,parent_id,p_name FROM prop WHERE parent_id = ".$val['id']." ORDER BY id ASC");
    $res[$key]['total_sub'] = count($res[$key]['sub']);
  }

  $count = count($res);
  $total = 0;
  for ($i=0; $i<$count; $i++) {
    foreach ($res[$i]['sub'] as $key=>$val) {
      $res[$i]['sub'][$key]['val'] = $GLOBALS['db']->getAll("SELECT id,p_value FROM prop_value WHERE p_id = ".$val['id']);
      $total = $total>count($res[$i]['sub'][$key]['val']) ? $total : count($res[$i]['sub'][$key]['val']);
    }
  }

  for ($t=0;$t<$count;$t++) {
    // 循环列
    for($i=0;$i<$res[$t]['total_sub'];$i++){
      // 循环行
      for($j=0;$j<$total;$j++){
        if ($i==2) {
          // 缩略图
          $res[$t]['prop_value'][$j][$i] = transPicture(@$res[$t]['sub'][$i]['val'][$j]['p_value']);
        } elseif ($i==4) {
          // 对应尺寸ID转为值
          $arr_size = get_easy_array($GLOBALS['db']->getAll("SELECT p_value FROM prop_value WHERE id IN (".$res[$t]['sub'][$i]['val'][$j]['p_value'].")"), 'p_value');
          $res[$t]['prop_value'][$j][$i] = array_str($arr_size);
        } else {
          $res[$t]['prop_value'][$j][$i] = $res[$t]['sub'][$i]['val'][$j]['p_value'];
        }
      }
    }
  }

  // echo '<pre>';
  // print_r($res);
  // echo '</pre>';
  return $res;
}
