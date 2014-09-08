deepClone = (obj) ->
  other = Object.create obj
  for own key, value of obj when value instanceof Object
    other[key] = deepClone(value)
  other

obi = (obj = {}) ->
  initialObject = deepClone obj
  extend: (extension) ->
    for key, value of extension
      initialObject[key] = extension[key]
    this
  done: -> initialObject

module.exports = obi
