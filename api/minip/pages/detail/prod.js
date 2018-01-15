var app = getApp()
function countdown(that) {
  var EndTime = that.data.end_time || [];
  var NowTime = new Date().getTime();
  var total_second = EndTime - Math.floor(NowTime/1000) || [];
  // console.log('剩余时间：' + total_second);
  that.setData({
    clock: dateformat(total_second)
  });
  if (total_second <= 0) {
    that.setData({
      clock: "00 天 00 时 00 分 00 秒"
    });
  }
  setTimeout(function () {
      total_second -= 1;
      countdown(that);
    }, 1000)
}
function dateformat(micro_second) {
  var second = Math.floor(micro_second);
  var day = Math.floor(second/3600/24);
  var hr = Math.floor(second/3600%24);
  var min = Math.floor(second/60%60);
  var sec = Math.floor(second%60);
  return day + " 天 " + transDigital(hr) + " 时 " + transDigital(min) + " 分 " + transDigital(sec) + " 秒";
}
function transDigital(num) {
  if (num < 10) {
    num = '0'+num
  }
  return num;
}

Page({

  /**
   * 页面的初始数据
   */
  data: {
    id:0,
    ex: {},
    imgs: [],
    end_time:0,
    clock: '',
    price: ''
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
        // console.log(e.data.ex)
        var arr_slider = e.data.ex.slideshow.split('|');
        var arr_tags = e.data.ex.d_tag.split('|');
        var arr_price = e.data.ex.d_price.split('|');
        var ex = e.data.ex;
        // console.log(arr)
        that.setData({
          imgs: arr_slider,
          ex: ex,
          tags: arr_tags,
          end_time: e.data.ex.d_edate,
          price: arr_price
        })
        wp.wxParse('content', 'html', e.data.ex.d_content, that, 5)
      }
    }),
    countdown(this);
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {}
})
