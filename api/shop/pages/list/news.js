var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list:[],
    page:2,
    page_total:2
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getList()
  },

  getList: function () {
    var that = this
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getList&id=2',
      dataType: 'json',
      success: function (e) {
        that.setData({
          list:e.data.ex,
          page_total:e.data.total
        })
      }
    })
  },

  showDetail:function(e){
    console.log(e.currentTarget.id)
    var id = e.currentTarget.id
    wx.navigateTo({
      url: '../detail/news?id='+id,
    })
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    var that = this
    if (that.data.page <= that.data.page_total) {
      wx.showLoading({
        title: '加载中',
      })
      wx.request({
        url: app.gData.apiUrl + 'common.php?act=getList&id=2&page=' + that.data.page,
        dataType: 'json',
        success: function (e) {
          var newlist = that.data.list;
          for(var i = 0; i < e.data.ex.length; i++) {
            newlist.push(e.data.ex[i]);
          }
          that.setData({
            list: newlist,
            page: that.data.page + 1
          })
          wx.hideLoading()
        }
      })
    } else {
      wx.showToast({
        title: '加载完毕',
        icon: 'success',
        duration: 2000
      })
    }
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {}
})