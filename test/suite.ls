# Module
obi = require '../lib'

# Dependencies
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai = require 'chai'
{expect} = chai
chai.use(sinonChai)

o = it
x = it.skip

describe 'obi', ->

  describe '#done', ->
    context 'when not given an initial object', ->
      beforeEach ->
        @obi = obi()

      o 'returns an empty object', ->
        expect(@obi.done()).to.eql {}

    context 'when given an initial object', ->
      beforeEach ->
        @initialObject = foo: 'foo'
        @obi = obi(@initialObject)

      o 'returns the initial object', ->
        expect(@obi.done()).to.eql @initialObject

  describe '#extend', ->
    beforeEach ->
      @obi = obi()

    context 'when extend is not given an object', ->
      o 'recursively calls obi with the initial object', ->
        expect(@obi.extend().done()).to.eql {}

    context 'when extend is given an object', ->
      o 'extends the initial object wrapped by obi', ->
        expect(@obi.extend(foo: 'foo').done()).to.eql foo: 'foo'

  describe 'immutability', ->
    context 'when obi is given an object initially', ->
      o 'clones the object', ->
        foo = foo: 'foo'
        expect(obi(foo).done()).to.not.equal foo
