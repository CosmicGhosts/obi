_ = require 'lodash'
soc = require 'soc'

obi = (initialObject = {}) ->
  initialObject = _.cloneDeep initialObject
  soc(initialObject)

module.exports = obi
