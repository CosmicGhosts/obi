{_extend} = require 'util'

obi = (initialObject) ->
  initialObject = _extend({}, initialObject)
  extend: (extension) ->
    obi _extend(initialObject, extension)
  done: -> initialObject

module.exports = obi
