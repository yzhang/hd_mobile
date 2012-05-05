{Panel}    = require('spine.mobile')

class HostelsList extends Panel
  title: '上海(<span class="hostel_count"></span>)'

  events:
    'tap .hostel' : 'show'

  constructor: (city) ->

    super

    @addButton('地图', @map).addClass('right')

    #Hostel.fetch()
    #@hostels = @buildTestHostels()

    @active @change

  render: =>
    @hostels = Hostel.all()
    $(".hostel_count").text(@hostels.length)
    @html require('views/hostels/hostel')(@hostels)

  change: (params) =>
    $('.stage>footer').show()
    $.ajax
      url: 'http://heikezhi.com:8080/api/v1/cities/%E4%B8%8A%E6%B5%B7.json'
      type: 'get'
      beforeSend: ->
        $('.global-spinner').show()
      success: (data) =>
        for h in data.hostels
          hostel = new Hostel
          hostel.load(h)
          hostel.save()
        for r in data.rooms
          room   = new Room
          room.load(r)
          room.save()
        for p in data.places
          place   = new Place
          place.load(p)
          place.save()
        for t in data.traffic_routes
          traffic   = new TrafficRoute
          traffic.load(t)
          traffic.save()
        @render()
      complete: ->
        $('.global-spinner').hide()

  show: (e) =>
    hostel = $(e.target).closest('div').item()
    @navigate('/hostels', hostel.id, trans: 'right')

  buildTestHostels: ->
    hostel1 = new Hostel
      id: 1
      name: '上海测试青旅#1'
      city: '上海'
      desc: '上海很好的一家青旅'
      equipment: '设备很齐全'
      is_yha: true
      address: '黄浦区外滩'
      phone_number: '021-65542380'
      m_w: true

    hostel1.save()

    Room.create
      hostel_id: hostel1.id
      name: '6人间'
      price: 50
      member_price: 45
    Room.create
      hostel_id: hostel1.id
      name: '4人间'
      price: 60
      member_price: 65

    hostel2 = new Hostel
      id: 2
      name: '上海测试青旅#2'
      city: '上海'
      desc: '上海很好的一家青旅'
      equipment: '设备很齐全，空调，WIFI信号很不错'
      is_yha: true
      address: '徐汇区徐家汇'
      phone_number: '021-65542380'
      m_w: true

    hostel2.save()

    Room.create
      hostel_id: hostel2.id
      name: '6人间'
      price: 80
      member_price: 70
    Room.create
      hostel_id: hostel2.id
      name: '4人间'
      price: 100
      member_price: 90

    place1 = Place.create
      name: '东方明珠'
      desc: '恩，就是那个很错他的电视塔'
      landscape: true

    place2 = Place.create
      name: '上海南站'
      desc: '恩，就是上海那个新火车站'
      landscape: false

    TrafficRoute.create
      hostel_id: hostel1.id
      place_id:  place1.id
      desc:      '这个应该是什么描述'
      from_hostel:      '从旅馆去应该这么走'
      to_hostel:        '到旅馆去应该这么走'

    TrafficRoute.create
      hostel_id: hostel1.id
      place_id:  place2.id
      desc:      '这个应该是什么描述'
      from_hostel:      '从旅馆去应该这么走'
      to_hostel:        '到旅馆去应该这么走'

    [hostel1, hostel2]

module.exports = HostelsList
