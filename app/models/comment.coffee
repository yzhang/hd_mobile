Spine = require('spine')

class @Comment extends Spine.Model
  @configure "Comment", 'hostel_id', 'content'

  @extend    Spine.Model.Local

module.exports = Comment
