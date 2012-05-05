{Panel}          = require('spine.mobile')

class CitiesList extends Panel
  title: '选择城市'

  events:
    'tap .city': 'click'

  constructor: ->
    super
    shanghai =
      name: '上海'
      slug: 'shanghai'
    beijing =
      name: '北京'
      slug: 'beijing'
    chengdu =
      name: '成都'
      slug: 'chengdu'
    xiamen =
      name: '厦门'
      slug: 'xiamen'

    @active (params) =>
      $('nav').hide()
      @render()

    @cities = [shanghai, beijing, chengdu, xiamen]

  render: =>
    @html require('views/cities/city')(@cities)

  click: (e) =>
    item = $(e.target).item()
    @navigate('/cities', item.slug, trans: 'right')

  favirates: ->
    @navigate('/favirates', trans: 'right')

module.exports = CitiesList
