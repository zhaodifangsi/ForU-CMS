<?php
$privilege = 'member';
include '../library/inc.php';

if (isset($_POST['submit'])) {
  $u_rid = isset($_POST['u_rid']) ? $_POST['u_rid'] : '';
  if ($_GET['id']==1) {
    alert_back('该用户为内置用户无法操作!');
  }
  $u_psw = trim($_POST['u_psw']);
  $u_cash = trim($_POST['u_cash']);
  if (!empty($u_psw)) {
    $sql = "UPDATE user SET u_rid='" . $u_rid . "',u_psw='" . md5($u_psw) . "',u_cash=" . $u_cash . " WHERE id = " . $_GET['id'];
  } else {
    $sql = "UPDATE user SET u_rid='" . $u_rid . "',u_cash=" . $u_cash . " WHERE id = " . $_GET['id'];
  }
  $dataops->ops($sql, '会员编辑['.$_GET['id'].']', 1);
}
?>
<!DOCTYPE html>
<html class="no-js fixed-layout">
<head>
<?php include 'inc/inc_head.php';?>
</head>

<body>
<?php include 'inc/inc_header.php';?>

<div class="am-cf admin-main">
  <!-- content start -->
  <div class="admin-content">
    <div class="am-g am-g-fixed">
      <div class="am-u-sm-12 am-padding-top">
        <?php
        $res = $db->getRow("SELECT * FROM user WHERE id = " . $_GET['id']);
        if ($row = $res) {
        ?>
        <section class="am-panel am-panel-default">
          <header class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">会员信息<span class="am-icon-chevron-down am-fr"></span></header>
          <form action="" method="post" class="am-form">
            <main class="am-panel-bd am-panel-bordered am-collapse am-in" id="collapse-panel-1">
              <div class="am-form-group">
                <label>账户</label>
                <div><?php echo $row['u_name']?></div>
              </div>
              <div class="am-form-group">
                <label>密码</label>
                <div><input type="text" name="u_psw" value="" placeholder="不需要修改请留空"/></div>
              </div>
              <div class="am-form-group">
                <label>Email</label>
                <div><?php echo @$row['u_email']?></div>
              </div>
              <div class="am-form-group">
                <label>余额</label>
                <div><input type="text" name="u_cash" value="<?php echo $row['u_cash']?>" readonly></div>
              </div>
              <div class="am-form-group">
                <label>积分</label>
                <div><?php echo $row['u_point']?></div>
              </div>
              <div class="am-form-group">
                <label>姓名</label>
                <div><?php echo $row['u_tname']?></div>
              </div>
              <div class="am-form-group">
                <label>手机</label>
                <div><?php echo $row['u_mobile']?></div>
              </div>

              <?php
              $addr = $db->getAll("SELECT * FROM user_address WHERE u_id=".$row['id']);
              foreach($addr as $k=>$v){
                echo '<div class="am-form-group"> <label>地址'.($k+1).'</label> <div>'.$v["u_province"].$v["u_city"].$v["u_district"].'<br>'.$v["u_addr"].'<br>'.$v["u_post"].' </div> </div>';
              }
              ?>

              <center><button type="submit" name="submit" id="save" class="am-btn am-btn-default">提交保存</button></center>
            </main>
          </form>
        </section>
        <?php } ?>
      </div>
    </div>
  </div>
  <!-- content end -->
</div>

<?php include 'inc/inc_footer.php';?>
</body>
</html>