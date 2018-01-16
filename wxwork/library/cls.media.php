<?php
namespace Wxwork;
/**
 * type ['image','voice','video','file']
 * <form action="getUrl('image')" method="post" enctype="multipart/form-data">
 * <input type="file" name="media"/>
 * <input type="submit" value="上传" />
 * </form>
 * image:2M;voice:2M;video:10M;file:20M
 */
class Media extends Base {
  public function __construct() {}

  // 获取上传url
  public function getUrl($type){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/media/upload?access_token=$access_token&type=$type";
    return $url;
  }

  // 获取临时素材
  public function getMedia($media_id){
    $access_token = $this->getAccessToken();
    $url = "https://qyapi.weixin.qq.com/cgi-bin/media/get?access_token=$access_token&media_id=$media_id";
    return json_decode(\https_get($url));
  }
}
