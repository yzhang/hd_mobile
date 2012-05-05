{Panel}     = require('spine.mobile')

class HostelShow extends Panel
  title: '<span class="hostel_name"></span>'

  events:
    'tap .show-comments' : 'showComments'


  constructor: ->
    super

    @active @change

    @addButton('后退', @back)
    @addButton('地图', @map).addClass('right')

  back: =>
    @navigate('/cities/shanghai', trans: 'left')

  render: =>
    return unless @hostel
    @html require('views/hostels/detail')(@hostel)

  change: (params) =>
    $('.stage>footer').show()
    @hostel = Hostel.find(params.id)
    $(".hostel_name").text(@hostel.name)
    @hostel.rooms      = Room.findAllByAttribute('hostel_id', parseInt(params.id))
    @hostel.spots      = []
    @hostel.transports = []

    traffics = TrafficRoute.findAllByAttribute('hostel_id', parseInt(params.id))

    for t in traffics
      p = Place.find(t.place_id)
      p.from = t.from_hostel
      p.to   = t.to_hostel
      if p.landscape
        @hostel.spots.push(p)
      else
        @hostel.transports.push(p)

    @render()

  showComments: (e) =>
    hostel_id = $(e.target).data('hostel-id')
    @navigate('/hostels', hostel_id, 'comments', trans: 'right')

module.exports = HostelShow
