<?php
include_once 'conf.php';
include_once '../library/inc.php';
include '../library/cls.wepay.php';

$wepay = new Wpay();
$wepay->notify_url();
