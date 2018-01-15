// pages/user/check.js
Page({

  data: {
  },

  onLoad: function (options) {
    this.checkUser()
  },

  checkUser:function(){
    var that = this
    var oid = wx.getStorageSync('openid')
    try {
      var value = wx.getStorageSync('openid')
      wx.request({
        url: apiUrl + 'user.php?act=check&oid=' + oid,
        success:function(e){
          if (e.data.err==0) {
            wx.navigateTo({
              url: 'index',
            })
          } else {
            that.checkFail()
          }
        }
      })
    } catch (e) {
      that.checkFail()
    }
  },

  checkFail:function(){
    wx.showToast({
      title: '获取用户登录态失败，请重新登录！',
      duration: 2000
    })
    wx.navigateTo({
      url: 'login',
    })
  }

})