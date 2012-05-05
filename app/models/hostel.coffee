Spine = require('spine')

class @Hostel extends Spine.Model
  @configure "Hostel", "name", "city", "desc", "district", "equipment", "logo_url", "photo_url", "yha", "address", "phone", "minimum_price", "latitude", 'longitude', "last_comment", "comments_count"

  @extend    Spine.Model.Local

module.exports = Hostel
