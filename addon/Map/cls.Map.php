<?php
include_once LIB_PATH.'cls.addon.php';

class Map extends Addon{
  public function baiduMap() {
    echo '<div data-am-widget="map" class="am-map am-map-default" data-name="'.$this->getConfig('map','name').'" data-address="'.$this->getConfig('map','addr').'"'.($this->getConfig('map','longitude')?'data-longitude="'.$this->getConfig('map','longitude').'" ':'data-longitude="" ').($this->getConfig('map','latitude')?'data-latitude="'.$this->getConfig('map','latitude').'" ':'data-latitude="" ').' data-scaleControl="" data-zoomControl="'.$this->getConfig('map','zoomcontrol').'" data-setZoom="'.$this->getConfig('map','zoom').'" data-icon="'.$this->getConfig('map','icon').'"><div id="bd-map"></div></div>';
  }
}