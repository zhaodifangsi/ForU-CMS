<?php
include_once LIB_PATH.'cls.addon.php';

class Map extends Addon{
    private $data;

    function __instruct() {
        $this->data = json_decode($this->getConfig('tags'), true);
    }

    // $limit -1无限制
    function setTagsA($col, $limit=1) {
        foreach ($this->data as $val) {
            if (strpos($col, $val['tag']) !== false) {
                $col = preg_replace("/".$val['tag']."/i", '<a href="'.$val['url'].'">'.$val['tag'].'</a>', $col, $limit);
            } else {
                continue;
            }
        }
        return $col;
    }
}