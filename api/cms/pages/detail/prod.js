var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id:0,
    title:'',
    date:'',
    imgs: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var id = this.setData({
      id: options.id
    })
    this.getInfo()
  },

  getInfo: function () {
    var that = this
    var wp = require('../../utils/wxParse/wxParse.js')
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getRow&id='+that.data.id+'&tbl=detail',
      dataType: 'json',
      success: function (e) {
        console.log(e.data.ex)
        var arr = e.data.ex.slideshow.split('|');
        console.log(arr)
        that.setData({
          title: e.data.ex.d_name,
          date: e.data.ex.date,
          imgs: arr
        })
        wp.wxParse('content', 'html', e.data.ex.d_content, that, 5)
      }
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {}
})