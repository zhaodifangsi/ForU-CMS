var app = getApp();
var addr_name='';
var addr_mobile='';
var addr_address='';

Page({
  data: {
    addr_name:'',
    addr_mobile:'',
    addr_address:''
  },

  onLoad: function () {
    wx.showLoading({
      title: '加载中',
    })
    this.getAddr()
    wx.hideLoading()
  },

  onReady: function () {
  },

  getAddr:function(){
    var that = this
    var openid = wx.getStorageSync('openid')
    wx.request({
      url: app.gData.apiUrl+'user.php?act=getAddr&openid='+openid,
      success:function(e){
        console.log(e);
        var ex = e.data.ex
        // wx.setStorageSync('uid', ex.id);
        that.setData({
          addr_name:ex.u_tname,
          addr_mobile:ex.u_mobile,
          addr_address:ex.ua_location
        })
      },
      fail:function(e){
        console.log(e);
      }
    });
  },

  addrSubmit: function() {
    var openid = wx.getStorageSync('openid')
    console.log(addr_name, addr_mobile, addr_address);
    wx.request({
      url: app.gData.apiUrl+'user.php?act=addr&openid='+openid,
      data: {
        'addr_name': addr_name,
        'addr_mobile': addr_mobile,
        'addr_address': addr_address
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      success:function(e){
        console.log(e);
        wx.showToast({
          title: '提交成功',
          duration: 2000
        })
      },
      fail:function(e){
        console.log(e);
      }
    });
  }
});
