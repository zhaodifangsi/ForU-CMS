var app = getApp()
var common = require('../../utils/common.js')
var user = require('../../utils/user.js')

Page({
  data:{
  },

  onLoad: function (e) {
    user.checkUser()
  }

})
