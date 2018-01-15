<?php
include '../../config/wxwork.php';
include '../../library/inc.php';
include '../library/cls.base.php';
//第一步: 生成JSAPI签名
$wxbase = new \Wxwork\Base(CORPID, APPSCRET);
$signPackage = $wxbase->getSignPackage();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title><?php echo TITLE;?></title>
    <link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui-for-work.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
</head>

<body>
<div class="">
<!--
    <div class="page__hd">
        <h1 class="page__title">发送通知</h1>
        <p class="page__desc">表单输入</p>
    </div>
 -->
    <div class="page__bd">
        <form class="notice-form">
            <div class="weui-cells__title">范围:</div>
            <div class="weui-cells">
                <div class="weui-cell weui-cell_access">
                    <div class="weui-cell__bd">
                        <input class="notice-user weui-input" type="text" placeholder="选择部分或成员" data-dept="" data-user="" readonly required/>
                    </div>
                </div>
            </div>

            <div class="weui-cells__title">主题:</div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="notice-subject weui-input" type="text" placeholder="请输入文本" minlength="2" required/>
                    </div>
                </div>
            </div>

            <div class="weui-cells__title">内容:</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="notice-msg weui-textarea" placeholder="请输入文本" rows="3" minlength="5" maxlength="200" required></textarea>
                        <div class="weui-textarea-counter"><span>0</span>/200</div>
                    </div>
                </div>
            </div>

            <div class="weui-cells__title"></div>
            <div class="page__bd_spacing">
                <button type="button" class="notice-btn weui-btn weui-btn_primary">提交</button>
            </div>
        </form>
    </div>
    <div class="page__ft">
        <a href="javascript:;">石榴木</a>
    </div>
</div>
</body>

<!-- 引入文件 -->
<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
wx.config({
    beta: true,// 必须这么写，否则在微信插件有些jsapi会有问题
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '<?php echo $signPackage['appId'];?>', // 必填，企业微信的corpID
    timestamp: <?php echo $signPackage['timestamp'];?>, // 必填，生成签名的时间戳
    nonceStr: '<?php echo $signPackage["nonceStr"];?>', // 必填，生成签名的随机串
    signature: '<?php echo $signPackage["signature"];?>',// 必填，签名，见[附录1](#11974)
    jsApiList: ['selectEnterpriseContact'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    // js接口列表
    // 'onMenuShareAppMessage', 'onMenuShareWechat', 'startRecord', 'stopRecord', 'onVoiceRecordEnd', 'playVoice', 'pauseVoice', 'stopVoice', 'onVoicePlayEnd', 'uploadVoice', 'downloadVoice', 'chooseImage', 'previewImage', 'uploadImage', 'downloadImage', 'previewFile', 'getNetworkType', 'openLocation', 'getLocation', 'onHistoryBack', 'hideOptionMenu', 'showOptionMenu', 'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem', 'showAllNonBaseMenuItem', 'closeWindow', 'scanQRCode', 'selectEnterpriseContact', 'openEnterpriseChat', 'chooseInvoice'
});
$(function(){
    $('.notice-btn').click(function(){
        var str_dept = $('.notice-user').attr('data-dept');
        var str_user = $('.notice-user').attr('data-user');
        var subject = $('.notice-subject').val();
        var msg = $('.notice-msg').val();

        $.ajax({
            url:'ajax.php',
            data:'act=send_notice&dept_ids='+str_dept+'&user_ids='+str_user+'&subject='+subject+'&msg='+msg,
            type:'post',
            success:function(res){
                if (res.errcode==0) {
                    alert(res.msg);
                } else {
                    console.log(res);
                }
            },
            error:function(){
                console.log('error');
            }
        });
    });

    $('.notice-user').click(function(){
        wx.invoke("selectEnterpriseContact", {
            "fromDepartmentId": 0,// 必填，-1表示打开的通讯录从自己所在部门开始展示, 0表示从最上层开始
            "mode": "multi",// 必填，选择模式，single表示单选，multi表示多选
            "type": ["department", "user"],// 必填，选择限制类型，指定department、user中的一个或者多个
            // "selectedDepartmentIds": ["2","3"],// 非必填，已选部门ID列表。用于多次选人时可重入
            // "selectedUserIds": ["lisi","lisi2"]// 非必填，已选用户ID列表。用于多次选人时可重入
        }, function(res){
            if (res.err_msg == "selectEnterpriseContact:ok") {
                if(typeof res.result == 'string') {
                    res.result = JSON.parse(res.result) //由于目前各个终端尚未完全兼容，需要开发者额外判断result类型以保证在各个终端的兼容性
                }
                var selectedDepartmentList = res.result.departmentList;// 已选的部门列表
                var str_dept = '';
                var str_dept_name = '';
                for (var i = 0; i < selectedDepartmentList.length; i++) {
                    var department = selectedDepartmentList[i];
                    var departmentId = department.id;// 已选的单个部门ID
                    var departemntName = department.name;// 已选的单个部门名称
                    str_dept += (i>0 ? '|'+departmentId : departmentId);
                    str_dept_name += departemntName+' ';
                }
                $('.contact').attr('data-dept',str_dept);

                var selectedUserList = res.result.userList; // 已选的成员列表
                var str_user = '';
                var str_user_name = '';
                for (var i = 0; i < selectedUserList.length; i++) {
                    var user = selectedUserList[i];
                    var userId = user.id; // 已选的单个成员ID
                    var userName = user.name;// 已选的单个成员名称
                    var userAvatar= user.avatar;// 已选的单个成员头像
                    str_user += (i>0 ? '|'+userId : userId);
                    str_user_name += userName+' ';
                }
                $('.contact').attr('data-user',str_user);

                $('.contact').val(str_dept_name + str_user_name);
            }
        });
    });
})
</script>
</html>
