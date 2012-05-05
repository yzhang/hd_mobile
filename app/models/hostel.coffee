Spine = require('spine')

class @Hostel extends Spine.Model
  @configure "Hostel", "name", "city", "desc", "equipment", "main_photo", "is_yha", "address", "phone_number", "m_w", "latitude", 'longitude'
  @extend    Spine.Model.Local
  
module.exports = Hostel