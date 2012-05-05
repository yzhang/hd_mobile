{Panel}    = require('spine.mobile')

class CommentsList extends Panel
  title: 'Comments'

  constructor: ->
    super

    @active @change
    @addButton('后退', @back)

  change: (params) ->
    @hostel_id = Number(params.id)
    @comments = Comment.findAllByAttribute('hostel_id', @hostel_id)

    @render()

  render: =>
    @html require('views/hostels/comment')(@comments)

  back: =>
    @navigate('/hostels', @hostel_id, trans: 'left')

module.exports = CommentsList
