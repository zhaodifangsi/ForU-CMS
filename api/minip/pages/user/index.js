var app = getApp()
var common = require('../../utils/common.js')
var user = require('../../utils/user.js')
var base64 = require("../../weui/images/base64")

Page({
  data:{
    icon20:'',
    icon60:''
  },

  onLoad: function (e) {
    user.checkUser();
    this.setData({
      icon20: base64.icon20,
      icon60: base64.icon60
    });
  }

})
