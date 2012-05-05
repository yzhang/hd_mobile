class @Place extends Spine.Model
  @configure "Place", "city", "name", "desc", "landscape", "district", "address", "latitude", "longitude"
  @extend    Spine.Model.Local

module.exports = Place