<?php
// 更新模板
if(!empty($_GET['t_id'])) {
  setcookie('cms[template_id]', str_safe($_GET['t_id']), time()+30*24*3600,'/');
  header('Location:../');
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--[if (gte IE 9)|!(IE)]><!-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!--<![endif]-->
<meta name="renderer" content="webkit">
<style>
.list{width:100%;list-style:none;margin:3rem auto;padding:0;overflow:hidden}
.list li{margin:1.5%;float:left;border:1px solid #ccc;width:30%;line-height: 2rem;position:relative;box-shadow: 0 0 10px rgba(0,0,0,.2);}
.list .qrcode{display:none;position:absolute;left:50%;margin-left:-60px;width:120px;height:120px;}
.list .qrcode img{width:120px;height:120px;}
.list li:hover .qrcode{display:block;}
.list a{color:#666;display:block;padding:0 20px;text-decoration:none;text-align:center}
.list .img{height:10rem;padding:0;position: relative;overflow:hidden;border-bottom:1px solid #ccc}
.list img{width:100%;height:auto; position: absolute; left: 0; top:0;}
@media screen and (max-width: 360px) {
  .list li{width:90%; margin:5%}
}
@media (min-width: 361px) and (max-width: 640px) {
  .list li{width:40%; margin:4%}
}
@media (min-width: 641px) and (max-width: 1024px) {
  .list li{width:30%; margin:1.5%;}
}
@media screen and (min-width: 1025px) {
  .list li{width:30%; margin:1.5%}
  .list .img{height:18vw;padding:0;overflow:hidden;border-bottom:1px solid #ccc}
}
</style>
</head>

<body>
<?php
$dir = './images/';
if(is_dir($dir)) {
  $file = scandir($dir);
  if(isset($file[2])) {
    foreach ($file as $val) {
      if ($val!='.' && $val!='..') {
        $filename = explode('.', $val);
        $arr[] = $filename[0];
      }
    }
    rsort($arr);
    echo '<ul class="list">';
    foreach ($arr as $val) {
      $img = "images/" . $val;
      echo '<li><a href="?t_id=' . $val . '" class="img"><img src="'. $img . (is_file($img.".jpg") ? ".jpg" : ".png").'"></a><a href="?t_id=' . $val . '">' . '网站' . $val . '</a></li>';
    }
    echo '</ul>';
  } else {
    echo '没有模板预览图片';
  }
} else {
    echo '模板图片文件夹不存在';
  }
?>

<script src="../js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
  $(".list>li>.img").hover(function(){
    var a_h = $(this).height();
    var img = $(this).children("img");
    var img_h = img.height();
    img.animate({top:"-"+(Number(img_h)-Number(a_h))+"px"},3000);
  },
  function(){
    $(this).children("img").animate({top:0},1000);
  });
});
</script>
</body>
</html>
<?php
unset($dir);
unset($file);
unset($t_id);
unset($arr);
