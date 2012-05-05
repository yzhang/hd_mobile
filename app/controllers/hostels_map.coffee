{Panel}    = require('spine.mobile')

class HostelsList extends Panel
  title: '上海(<span class="hostel_count"></span>)'


  constructor: (city) ->
    super

    @addButton('列表', @list).addClass('right')

    @active @change
  
  list: =>
    @navigate('/cities/shanghai', trans: 'left')

  render: =>
    @hostels = Hostel.all()
    $(".hostel_count").text(@hostels.length)
    @html require('views/hostels/map')([{hostels:@hostels}])

  change: (params) =>
    $('.stage>footer').show()
    @render()

module.exports = HostelsList
