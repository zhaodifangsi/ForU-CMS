function navPage(e){
  // console.log(e)
  wx.navigateTo({
  url: e.currentTarget.dataset.url,
  })
}

function tabPage(page){
  wx.switchTab({
  url: page,
  })
}

function navChannel(e){
  var id = e.currentTarget.id
  wx.navigateTo({
  url: 'channel?id='+id,
  })
}

function navDetail(e){
  var id = e.currentTarget.id
  wx.navigateTo({
  url: 'detail?id='+id,
  })
}

module.exports = {
  navPage:navPage,
  navChannel:navChannel,
  navDetail:navDetail,
  tabPage:tabPage
}
