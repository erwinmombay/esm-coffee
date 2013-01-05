define (require) ->
    describe 'test runner', ->
        BusinessEntityModel = require 'models/BusinessEntityModel'

        it 'should equal to one', ->
            expect(true).toBe true
