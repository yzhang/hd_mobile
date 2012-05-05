require('lib/setup')

Spine      = require('spine')
{Stage}    = require('spine.mobile')

Room       = require('models/room')
Place      = require('models/place')
TrafficRoute = require('models/traffic_route')
Hostel     = require('models/hostel')

CitiesList  = require('controllers/cities')
HostelsList = require('controllers/hostels_list')
HostelShow  = require('controllers/hostel_show')

class App extends Stage.Global
  events:
    'tap .cities' : 'cities'
    'tap .hostels' : 'hostels'
  
  cities:  => @navigate('/cities', trans: 'left')
  hostels: => @navigate('/cities/shanghai', trans: 'left')

  constructor: ->
    super
    
    $('.stage>footer').append("<div class='buttons'></div>")
    $('.stage>footer .buttons').append("<button class='hostels btn'>所有旅舍</button>")
    $('.stage>footer .buttons').append("<button class='favirates btn'>我的收藏</button>")
    $('.stage>footer .buttons').append("<button class='cities btn'>切换城市</button>")

    @citiesList = new CitiesList()
    @citiesList.active()

    @hostelsList = new HostelsList
    @hostelShow  = new HostelShow

    @routes
      '/cities/:slug': (params) -> @hostelsList.active(params)
      '/hostels/:id':  (params) -> @hostelShow.active(params)
      '/cities': (params) ->       @citiesList.active()


    Spine.Route.setup()

module.exports = App