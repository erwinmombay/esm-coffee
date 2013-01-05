define (require) ->
    _ = require 'underscore'
    BaseModel = require 'cs!models/BaseModel'

    class BusinessEntityModel extends BaseModel

        url: 'api/businessentity'

        defaults:
            code: ''
            name: ''
            address1: ''
            address2: ''
            city: ''
            stateOrProvince: ''
            postalCode: ''
            country: ''
            primaryIndustry: ''
            parentID: ''
            edictTestEntity: ''

        url: ->
            "api/businessentity/#{@id}"

        initialize: (options) ->

        parse: (response) ->
            if response?.Fields?
                parsedResponse = id: response.ID
                for	field in response.Fields.FieldItems
                    parsedResponse[field.Name] = field.Value
                parsedResponse
            response
