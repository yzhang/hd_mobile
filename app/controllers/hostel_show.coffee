{Panel}     = require('spine.mobile')

class HostelShow extends Panel
  title: '<span class="hostel_name"></span>'

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
    $('nav').show()
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
    
module.exports = HostelShow