require('lib/setup')

Spine      = require('spine')
{Stage}    = require('spine.mobile')

Room         = require('models/room')
Place        = require('models/place')
TrafficRoute = require('models/traffic_route')
Hostel       = require('models/hostel')

CitiesList  = require('controllers/cities')
FaviratesList  = require('controllers/favirates')
HostelsList = require('controllers/hostels_list')
HostelsMap  = require('controllers/hostels_map')
HostelShow  = require('controllers/hostel_show')

class App extends Stage.Global
  events:
    'tap .cities' : 'cities'
    'tap .hostels' : 'hostels'
    'tap .favirates' : 'favirates'

  cities:  => @navigate('/cities', trans: 'left')
  hostels: => @navigate('/cities/shanghai', trans: 'left')
  favirates: => @navigate('/favirates', trans: 'right')

  constructor: ->
    super
    $('body').append('<nav id="tabbar"><ul></ul></nav>')
    $('nav ul').append('<li><a href="#home" class="current flip hostels"><strong>所有旅社</strong><div class="home"></div></a></li>')
    $('nav ul').append('<li><a href="#categories" class="flip favirates"><strong>我的收藏</strong><div class="rss"></div></a></li>')
    $('nav ul').append('<li><a href="#more" class="flip cities"><strong>切换城市</strong><div class="flickr"></div></a></li>')

    @citiesList = new CitiesList()
    @citiesList.active()

    @hostelsList = new HostelsList
    @hostelsMap  = new HostelsMap
    @hostelShow  = new HostelShow
    @favirates   = new FaviratesList

    @routes
      '/cities/:slug': (params)     -> @hostelsList.active(params)
      '/cities/:slug/map': (params) -> @hostelsMap.active(params)
      '/hostels/:id':  (params)     -> @hostelShow.active(params)
      '/cities': (params)           -> @citiesList.active()
      '/favirates': (params)        -> @favirates.active()


    Spine.Route.setup()

  showSpinner: ->
    $('.global-spinner').show()

  hideSpinner: ->
    $('.global-spinner').hide()


module.exports = App
