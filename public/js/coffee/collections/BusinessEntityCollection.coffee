define (require) ->
    _ = require 'underscore'
    BaseCollection = require 'cs!collections/BaseCollection'
    BusinessEntityModel = require 'cs!models/BusinessEntityModel'

    class BusinessEntityCollection extends BaseCollection

        model: BusinessEntityModel

        url: 'api/businessentity'

        parse: (response) ->
            parsedResponse = []
            for model in response
                parsedModel = {}
                for fieldItems in model.Fields.FieldItems
                    parsedModel[fieldItems.Name] = fieldItems.Value
                parsedResponse.push parsedModel
            parsedResponse
