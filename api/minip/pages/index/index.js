var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list_prod:[],
    imgs:[]
  },

  onLoad: function () {
    this.getSlider()
    this.getListProd()
  },

  onPullDownRefresh:function(){
    this.getListProd()
  },

  getSlider:function(){
    var that = this
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getSlider',
      dataType: 'json',
      success: function (e) {
        console.log(e.data.ex)
        that.setData({
          imgs:e.data.ex
        })
      }
    })
  },

  getListProd:function(){
    var that = this
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getList&id=3&size=6',
      dataType: 'json',
      success: function (e) {
        console.log(e.data.ex)
        that.setData({
          list_prod:e.data.ex
        })
      }
    })
  },

  showDetailProd:function(e){
    var id = e.currentTarget.id
    wx.navigateTo({
      url: '../detail/prod?id='+id,
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {}
})
