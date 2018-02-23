var app = getApp()
var user = require('../../utils/user.js')

Page({
  data:{
    mobNum:'',
    mobCode:''
  },

  onLoad: function () {
    user.getUserInfo()
    user.getUserOpenId()
  },

  mobLogin: function(){
    if (this.data.mobCode == wx.getStorageSync('mobCode')) {
      console.log('验证码正确')
      var openid = wx.getStorageSync('openid')
      wx.request({
        url:app.gData.apiUrl+'user.php?act=login&openid='+openid+'&mobnum='+this.data.mobNum,
        success:function(e){
          if (e.data.err==0) {
            wx.setStorageSync('userState', true)
            wx.setStorageSync('uid', e.data.ex)
            wx.navigateTo({
              url: '../user/index',
            })
          } else {
            user.checkFail();
          }
        }
      })
    } else {
      wx.showModal({
        content: '验证码错误',
        showCancel: false
      });
    }
  },

  weLogin: function(){
    console.log(app.gData.userInfo)
    wx.navigateTo({
      url: '../user/index',
    })
  },

  getMobNum: function(e){
    console.log(e.detail.value)
    this.setData({
      mobNum: e.detail.value
    })
  },

  getMobCode: function(e){
    console.log(e.detail.value)
    this.setData({
      mobCode:e.detail.value
    })
  },

  setMobCode: function(){
    if (!(/^1[34578]\d{9}$/.test(this.data.mobNum))) {
      wx.showModal({
        content: '手机号有误',
        showCancel: false
      });
    } else {
      var openid = wx.getStorageSync('openid')
      wx.request({
        url:app.gData.apiUrl + 'user.php?act=getMobileCode&openid=' + openid,
        success:function(res){
          console.log(res.data)
          wx.setStorageSync('mobCode', res.data.ex);
        }
      })
    }
  }

})
