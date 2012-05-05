Spine = require('spine')

class @Hostel extends Spine.Model
  @configure "Hostel", "name", "city", "desc", "district", "equipment", "logo_url", "photo_url", "yha", "address", "phone_number", "m_w", "minimum_price"
  @extend    Spine.Model.Local

module.exports = Hostel
