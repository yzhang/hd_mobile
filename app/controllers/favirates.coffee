{Panel}          = require('spine.mobile')

class FaviratesList extends Panel
  title: '我的收藏'
  
  events:
    'tap .item' : 'show'
  
  show: (e) =>
    hostel = $(e.target).closest('.item').item()
    @navigate('/hostels', hostel.id, trans: 'right')

  constructor: ->
    super

    @active (params) =>
      $('nav').show()
      $('nav .favirates').addClass('current')
      $('nav .hostels').removeClass('current')
      @render()

  render: =>
    hostels = Hostel.all()
    @html require('views/favirates/hostel')([hostels[0], hostels[2]])

module.exports = FaviratesList
