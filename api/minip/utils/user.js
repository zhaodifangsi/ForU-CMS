function getUserInfo() {
  var app = getApp()
  wx.getUserInfo({
    withCredentials: false,
    success: function(res) {
      app.gData.userInfo = res.userInfo
    }
  })
}

function getUserOpenId(){
  var that = this
  var app = getApp()
  wx.login({
    success: function (res) {
      if (res.code) {
        //获取openId
        wx.request({
          url: 'https://api.weixin.qq.com/sns/jscode2session?appid='+app.gData.appId+'&secret='+app.gData.appSe+'&js_code='+res.code+'&grant_type=authorization_code',
          success: function(openIdRes){
            console.info("登录成功返回的openId：" + openIdRes.data.openid);
            // 判断openId是否获取成功
            if (openIdRes.data.openid != null & openIdRes.data.openid != undefined) {
              wx.setStorageSync('openid', openIdRes.data.openid);
            }else {
              console.info("获取用户openId失败");
            }
          },
          fail: function(error) {
            console.info("获取用户openId失败");
            console.info(error);
          }
        })
      }
    }
  });
}

function checkUser(){
  var app = getApp()
  // 检测登录态
  wx.checkSession({
    success: function(){
      var openid = wx.getStorageSync('openid')
      // 正常则比对openid
      wx.request({
        url: app.gData.apiUrl + 'user.php?act=check&openid=' + openid,
        success:function(e){
          console.log(e)
          // 返回正确的比对结果则进入用户中心否则重新登录
          if (e.data.err==0) {
            wx.setStorageSync('userState', true)
            wx.setStorageSync('uid', e.data.ex)
          } else {
            checkFail()
          }
        }
      })
    },
    // 错误重新登陆
    fail: function(){
      checkFail()
    }
  })
}

function checkFail(){
  wx.setStorageSync('userState', false)
  wx.setStorageSync('uid', '')
  wx.showToast({
    title: '获取用户登录态失败，请重新登录！',
    duration: 2000
  })
  wx.navigateTo({
    url: '../user/login',
  })
}

function getCurrentPage() {
  var pages = getCurrentPages();
  console.log(pages[pages.length-1].route);
  return pages[pages.length-1].route;
}

function userLogout() {
  wx.setStorageSync('openid', '');
  wx.switchTab({
    url: '/pages/index/index',
  })
}

module.exports = {
  getUserOpenId:getUserOpenId,
  getUserInfo:getUserInfo,
  checkUser:checkUser,
  checkFail:checkFail,
  getCurrentPage:getCurrentPage,
  userLogout:userLogout
}
