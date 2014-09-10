util = require 'util'

deepClone = (obj) ->
  return obj unless typeof obj is 'object'
  if util.isArray obj
    obj.map (x) -> deepClone(x)
  else
    other = Object.create obj
    for own key, value of obj when value instanceof Object
      other[key] = deepClone(value)
    other

obi = (obj = {}) ->
  initialObject = deepClone obj
  extend: (extension) ->
    if util.isArray(initialObject) and util.isArray(extension)
      initialObject := [...initialObject, ...extension]
    else
      util._extend(initialObject, extension)
    this
  done: -> initialObject

module.exports = obi
