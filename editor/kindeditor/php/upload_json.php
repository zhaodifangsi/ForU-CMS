<?php
include '../../../config/config.php';
/**
 * KindEditor PHP
 *
 * 本PHP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

require_once 'JSON.php';

$php_path = dirname(__FILE__) . '/';
$php_url = dirname($_SERVER['PHP_SELF']) . '/';

//文件保存目录路径
$save_path = $php_path . '../../../uploadfile/';
//文件保存目录URL
$save_url = $php_url . '../../../uploadfile/';
//定义允许上传的文件扩展名
$ext_arr = array(
	'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
	'flash' => array('swf'),
	'flv' => array('flv', 'f4v', 'mp4'),
	'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
	'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2', 'pdf', 'apk', 'ipa'),
);
//最大文件大小
$max_size = 500*1024*1024; //G*M*K*B

$save_path = realpath($save_path) . '/';

//PHP上传失败
if (!empty($_FILES['imgFile']['error'])) {
	switch($_FILES['imgFile']['error']){
		case '1':
			$error = '超过php.ini允许的大小。';
			break;
		case '2':
			$error = '超过表单允许的大小。';
			break;
		case '3':
			$error = '图片只有部分被上传。';
			break;
		case '4':
			$error = '请选择图片。';
			break;
		case '6':
			$error = '找不到临时目录。';
			break;
		case '7':
			$error = '写文件到硬盘出错。';
			break;
		case '8':
			$error = 'File upload stopped by extension。';
			break;
		case '999':
		default:
			$error = '未知错误。';
	}
	alert($error);
}

//有上传文件时
if (empty($_FILES) === false) {
	//原文件名
	$file_name = $_FILES['imgFile']['name'];
	//服务器上临时文件名
	$tmp_name = $_FILES['imgFile']['tmp_name'];
	//文件大小
	$file_size = $_FILES['imgFile']['size'];
	//检查文件名
	if (!$file_name) {
		alert("请选择文件。");
	}
	//检查目录
	if (@is_dir($save_path) === false) {
		alert("上传目录不存在。");
	}
	//检查目录写权限
	if (@is_writable($save_path) === false) {
		alert("上传目录没有写权限。");
	}
	//检查是否已上传
	if (@is_uploaded_file($tmp_name) === false) {
		alert("上传失败。");
	}
	//检查文件大小
	if ($file_size > $max_size) {
		alert("上传文件大小超过限制。");
	}
	//检查目录名
	$dir_name = empty($_GET['dir']) ? 'image' : trim($_GET['dir']);
	if (empty($ext_arr[$dir_name])) {
		alert("目录名不正确。");
	}
	//获得文件扩展名
	$temp_arr = explode(".", $file_name);
	$file_ext = array_pop($temp_arr);
	$file_ext = trim($file_ext);
	$file_ext = strtolower($file_ext);
	//检查扩展名
	if (in_array($file_ext, $ext_arr[$dir_name]) === false) {
		alert("上传文件扩展名是不允许的扩展名。\n只允许" . implode(",", $ext_arr[$dir_name]) . "格式。");
	}
	//创建文件夹
	if ($dir_name !== '') {
		$save_path .= $dir_name . "/";
		$save_url .= $dir_name . "/";
		if (!file_exists($save_path)) {
			mkdir($save_path);
		}
	}
	$ymd = date("Ymd");
	$save_path .= $ymd . "/";
	$save_url .= $ymd . "/";
	if (!file_exists($save_path)) {
		mkdir($save_path);
	}

	//新文件名
	$new_file_name = date("YmdHis") . '_' . rand(10000, 99999) . '.' . $file_ext;
	//移动文件
	$file_path = $save_path . $new_file_name;

	if (move_uploaded_file($tmp_name, $file_path) === false) {
		alert("上传文件失败。");
	}
	@chmod($file_path, 0644);
	$file_url = $save_url . $new_file_name;

	// 压缩图片
	if(UPLOAD_LIMIT && !empty($_POST['ifWidthLimit'])) {
		$imgproc = new Image_process($file_path);
		if($imgproc->source_width>UPLOAD_IMG){
			$imgproc->scaleImage(round(UPLOAD_IMG/$imgproc->source_width,1));
		} else {
			unset($imgproc);
		}
	}

	// 水印
	$water_img = '../water.png';
	if (!empty($_POST['ifWater'])) {
		$imgproc = new Image_process($file_path);
		$imgproc->watermarkImage($water_img);
	}

	header('Content-type: text/html; charset=UTF-8');
	$json = new Services_JSON();
	echo $json->encode(array('error' => 0, 'url' => $file_url));
	exit;
}

function alert($msg) {
	header('Content-type: text/html; charset=UTF-8');
	$json = new Services_JSON();
	echo $json->encode(array('error' => 1, 'message' => $msg));
	exit;
}

/*  用法:
    $s = new Image_process( $item );
    $s->watermarkImage($logo);  //生成水印
    $s->scaleImage(0.8);
    $s->fixSizeImage(200,false);//生成缩略图
 */
class Image_process{
    public $source;//原图
    public $source_width;//宽
    public $source_height;//高
    public $source_type_id;
    public $orign_name;
    public $orign_dirname;
    //传入图片路径
    public function __construct($source){
        $this->typeList      = array(1=>'gif',2=>'jpg',3=>'png');
        $ginfo               = getimagesize($source);
        $this->source_width  = $ginfo[0];
        $this->source_height = $ginfo[1];
        $this->source_type_id= $ginfo[2];
        $this->orign_url     = $source;
        $this->orign_name    = basename($source);
        $this->orign_dirname = dirname($source);
    }

    //判断并处理,返回PHP可识别编码
    public function judgeType($type,$source){
        if($type==1){
            return ImageCreateFromGIF($source);//gif
        }else if($type==2){
            return ImageCreateFromJPEG($source);//jpg
        }else if($type==3){
            return ImageCreateFromPNG($source);//png
        }else{
            return false;
        }
    }

    //生成水印图
    public function watermarkImage($logo){
        $linfo        = getimagesize($logo);
        $logo_width   = $linfo[0];
        $logo_height  = $linfo[1];
        $logo_type_id = $linfo[2];
        $sourceHandle = $this->judgeType($this->source_type_id,$this->orign_url);
        $logoHandle   = $this->judgeType($logo_type_id,$logo);

        if( !$sourceHandle || ! $logoHandle ){
            return false;
        }
        $x = $this->source_width - $logo_width;
        $y = $this->source_height- $logo_height;

        ImageCopy($sourceHandle,$logoHandle,$x,$y,0,0,$logo_width,$logo_width) or die("fail to combine");
      //  $newPic = $this->orign_dirname .'\water_'. time().'.'. $this->typeList[$this->source_type_id];
        $newPic = $this->orign_url;
        if( $this->saveImage($sourceHandle,$newPic)){
            imagedestroy($sourceHandle);
            imagedestroy($logoHandle);
        }
    }

    // fix 宽度
    // height = true 固顶高度
    // width  = true 固顶宽度
    public function fixSizeImage($width,$height){
        if( $width > $this->source_width) $this->source_width;
        if( $height > $this->source_height ) $this->source_height;
        if( $width === false){
            $width = floor($this->source_width / ($this->source_height / $height));
        }
        if( $height === false){
            $height = floor($this->source_height / ($this->source_width / $width));
        }
        $this->tinyImage($width,$height);
    }

    //比例缩放
    // $scale 缩放比例
    public function scaleImage($scale){
        $width  = floor($this->source_width * $scale);
        $height = floor($this->source_height * $scale);
        $this->tinyImage($width,$height);
    }

    //创建略缩图
    private function tinyImage($width,$height){
        $tinyImage = imagecreatetruecolor($width, $height );
        $handle    = $this->judgeType($this->source_type_id,$this->orign_url);
        if(function_exists('imagecopyresampled')){
            imagecopyresampled($tinyImage,$handle,0,0,0,0,$width,$height,$this->source_width,$this->source_height);
        }else{
            imagecopyresized($tinyImage,$handle,0,0,0,0,$width,$height,$this->source_width,$this->source_height);
        }

        // $newPic = time().'_'.$width.'_'.$height.'.'. $this->typeList[$this->source_type_id];
        // $newPic = $this->orign_dirname .'\thumb_'. $newPic;
        $newPic = $this->orign_url;
        if( $this->saveImage($tinyImage,$newPic)){
            imagedestroy($tinyImage);
            imagedestroy($handle);
        }
    }

    //保存图片
    private function saveImage($image,$url){
        if(ImageJpeg($image,$url)){
            return true;
        }
    }
}