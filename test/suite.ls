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

    context 'when given an array', ->

      beforeEach ->
        @initialObject = [1,2,3]
        @obi = obi(@initialObject)

      o 'returns a clone of the array', ->
        expect(@obi.done()).to.eql @initialObject

  describe '#extend', ->
    context 'given an empty obi', ->
      beforeEach ->
        @obi = obi()

      context 'when extend is not given an object', ->
        o 'recursively calls obi with the initial object', ->
          expect(@obi.extend().done()).to.eql {}

      context 'when extend is given an object', ->
        o 'extends the initial object wrapped by obi', ->
          expect(@obi.extend(foo: 'foo').done()).to.eql foo: 'foo'

      context 'when extend is given an array', ->
        o 'extends the initial object with the array key/value pairs', ->
          expect(@obi.extend([1,2,3]).done()).to.eql 0: 1, 1: 2, 2: 3

    context 'given an obi-wrapped array', ->
      beforeEach ->
        @obi = obi([1,2])

      context 'when extend is given another array', ->
        o 'concatenates the arrays', ->
          expect(@obi.extend([3,4]).done()).to.eql [1,2,3,4]

  describe 'immutability', ->
    context 'when obi is given an object', ->
      o 'clones the object', ->
        foo = foo: 'foo'
        expect(obi(foo).done()).to.not.equal foo

      o 'clones the nested properties of an object', ->
        foo = foo:
          bar: 'foo',
          baz:
            fizz: 'buzz'
        obj = obi(foo).done()
        expect(obj.foo.baz).to.not.equal foo.foo.baz

    context 'when obi is given an array', ->
      o 'clones the array', ->
        foo = ['foo']
        expect(obi(foo).done()).to.not.equal foo

      o 'clones the nested properties of an array', ->
        foo = [ bar: 'foo' ]
        obj = obi(foo).done()
        expect(obj[0]).to.not.equal foo[0]
