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
    if (this.data.mobNum!='' && this.data.mobCode!='') {
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
        content: '请核对手机号及验证码正确后重试',
        showCancel: false
      });
    }
  },

  weLogin: function(){
    console.log(app.gData.userInfo)
    user.checkUser()
    wx.navigateTo({
      url: '../user/index',
    })
  },

  getMobNum: function(e){
    console.log(e.detail.value)
    if (!(/^1[34578]\d{9}$/.test(e.detail.value))) {
      wx.showModal({
        content: '手机号有误',
        showCancel: false
      });
      return false;
    } else {
      this.setData({
        mobNum:e.detail.value
      })
      return true;
    }
  },

  getMobCode: function(e){
    if (e.detail.value != wx.getStorageSync('mobCode')) {
      wx.showModal({
        content: '验证码有误',
        showCancel: false
      });
      return false;
    } else {
      this.setData({
        mobCode:e.detail.value
      })
      return true;
    }
  },

  setMobCode: function(){
    var openid = wx.getStorageSync('openid')
    wx.request({
      url:app.gData.apiUrl + 'user.php?act=getMobileCode&openid=' + openid,
      success:function(res){
        console.log(res.data)
        wx.setStorageSync('mobCode', res.data.ex);
      }
    })
  }

})
