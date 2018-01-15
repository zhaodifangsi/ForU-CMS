<?php
$privilege = 'member';
include '../library/inc.php';
include_once LIB_PATH.'cls.page.php';

if (isset($_POST['execute'])) {
  null_back(@$_POST['id'],'请至少选中一项！');
  $id = $s = '';
  foreach ($_POST['id'] as $value) {
    $id .= $s.$value;
    $s = ',';
  }
  switch ($_POST['execute_method']) {
    case 'enable':
      $sql = "UPDATE user SET u_enable = 1 WHERE id in (" . $id . ")";
      break;
    case 'unable':
      $sql = "UPDATE user SET u_enable = 0 WHERE id in (" . $id . ")";
      break;
    default:
      alert_back('请选择要执行的操作');
  }
  $dataops->ops($sql, '', 1);
}
if (isset($_GET['del'])) {
  $sql = "DELETE FROM user WHERE id = " . $_GET['del'];
  $dataops->ops($sql, '会员删除['.$_GET['del'].']');
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

        <section class="am-panel am-panel-default">
          <header class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">会员管理<span class="am-icon-chevron-down am-fr"></span></header>
          <main class="am-panel-bd am-collapse am-in am-scrollable-horizontal" id="collapse-panel-1">
            <form method="get" class="am-form am-show-sm-up am-nbfc">
                <div class="am-u-sm-12">
                  <div class="am-input-group am-input-group-sm">
                    <input id="key" class="am-form-field" type="text" name="key" placeholder="名称查找" />
                    <span class="am-input-group-btn"><button type="submit" id="search" class="am-btn" name="search">检索</button></span>
                  </div>
                </div>
            </form>
            <hr/>
            <form action="" method="post">
            <table class="am-table am-table-striped am-table-bordered am-table-compact admin-content-table am-text-nowrap">
              <thead>
              <tr>
                <th>ID</th><th>帐号</th><th>邮箱</th><th>手机</th><th>状态</th><th>操作</th>
              </tr>
              </thead>
              <tbody>
                <?php
                $page = new Page(20);
                $page->handle($db->getOne("SELECT COUNT(*) FROM user WHERE id>1"));
                $res = $db->getAll("SELECT * FROM user WHERE id>1 ORDER BY id DESC LIMIT ".$page->page_start.",".$page->page_size);
                if (!empty($res)) {
                  foreach($res as $row){
                    echo '<tr><td><input type="checkbox" name="id[]" value="'.$row['id'].'" /></td><td>' . $row['u_name'] . '</td><td>' . $row['u_email'] . '</td><td>' . $row['u_mobile'] . '</td><td>'.($row['u_enable']?'正常':'待审').'</td><td><a href="cms_member_edit.php?id=' . $row['id'] . '" class="am-btn am-btn-default am-btn-xs"><span class="am-icon-pencil"></span></a> <a href="cms_member.php?del=' . $row['id'] . '" onclick="return confirm(\'确认要删除吗？\')" class="am-btn am-btn-default am-btn-xs"><span class="am-icon-times"></span></a></td></tr>';
                  }
                }
                ?>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="6">
                      <input type="button" id="check_all" value="全选" />
                      <input type="button" class="form_button" id="check_none" value="不选" />
                      <input type="button" class="form_button" id="check_invert" value="反选" />
                      <select id="execute_method" name="execute_method">
                        <option value="">请选择操作</option>
                        <option value="enable">通过审核</option>
                        <option value="unable">取消审核</option>
                      </select>
                      <input type="submit" id="execute" name="execute" onclick="return confirm('确定要执行吗')" value="执行" />
                  </td>
                </tr>
              </tfoot>
            </table>
            </form>
            <div data-am-page="{pages:<?php echo $page->page_sum;?>,curr:<?php echo $page->page_current;?>,jump:'?page=%page%'}"></div>
          </main>
        </section>

      </div>
    </div>
  </div>
  <!-- content end -->
</div>

<?php include 'inc/inc_footer.php';?>

<!-- js -->
<script type="text/javascript">
$(function(){
  $('#check_all').click(function(){
    $('input[name="id[]"]:checkbox').attr('checked',true);
  });
  $('#check_none').click(function(){
    $('input[name="id[]"]:checkbox').attr('checked',false);
  });
  $('#check_invert').click(function(){
    $('input[name="id[]"]:checkbox').each(function(){
      this.checked = !this.checked;
    });
  });
  //操作执行验证
  $('#execute').click(function(){
    if ($('#execute_method').val() == ''){
      alert('请选择一项要执行的操作！');
      return false;
    };
    if ($('input[name="id[]"]').val() = ''){
      alert('请至少选择一项！');
      return false;
    };
  });
  //搜索验证
  $('#search').click(function(){
    if ($('#key').val() == ''){
      alert('请输入要查找的关键字');
      $('#key').focus();
      return false;
    };
  });
});
</script>
</body>
</html>