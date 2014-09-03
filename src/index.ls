_ = require 'lodash'

obi = (initialObject = {}) ->
  initialObject = _.cloneDeep initialObject
  extend: (extension) ->
    obi _.extend(initialObject, extension)
  done: -> initialObject

module.exports = obi
