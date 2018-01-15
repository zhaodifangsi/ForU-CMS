var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list_prod:[],
    list_news:[],
    imgs:[]
  },

  onLoad: function () {
    // this.transData()
    this.getSlider()
    this.getListProd()
    this.getAbout()
    this.getListNews()
  },

  /*
  onPullDownRefresh:function(){
    this.getSlider()
    this.getListProd()
    this.getAbout()
    this.getListNews()
    wx.stopPullDownRefresh;
  },
  */

  transData:function(){
    this.setData({
      imgs: app.gData.imgs_index,
      list_prod: app.gData.list_prod_index,
      list_news: app.gData.list_news_index
    })
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
        that.setData({
          list_prod:e.data.ex
        })
      }
    })
  },

  showDetailProd:function(e){
    var id = e.currentTarget.id
    wx.navigateTo({
      url: '../detail-prod/detail-prod?id='+id,
    })
  },

  getAbout: function () {
    var that = this
    var wp = require('../../utils/wxParse/wxParse.js')
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getCol&id=1&tbl=channel&col=c_content&size=120',
      dataType: 'json',
      success: function (e) {
        wp.wxParse('about', 'html', e.data.ex, that, 5)
      }
    })
  },

  getListNews: function () {
    var that = this
    wx.request({
      url: app.gData.apiUrl + 'common.php?act=getList&id=2&size=4',
      dataType: 'json',
      success: function (e) {
        that.setData({
          list_news:e.data.ex
        })
      }
    })
  },

  showDetailNews:function(e){
    var id = e.currentTarget.id
    wx.navigateTo({
      url: '../detail-news/detail-news?id='+id,
    })
  },

  navProduct:function(){
    wx.switchTab({
      url:'../product/product',
      success:function(){}
    })
  },

  navAbout:function(){
    wx.switchTab({
      url:'../about/about',
      success:function(){}
    })
  },

  navNews:function(){
    wx.switchTab({
      url:'../news/news',
      success:function(){}
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {}
})