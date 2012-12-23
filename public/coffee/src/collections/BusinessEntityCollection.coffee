define (require) ->
    _ = require 'underscore'
    BaseCollection = require 'collections/BaseCollection'
    BusinessEntityModel = require 'models/BusinessEntityModel'

	class BusinessEntityCollection extends BaseCollection

		model: BusinessEntityModel

		url: 'api/businessentity'

		parse: (response) ->
			parsedResponse = []
			for model in response
				parsedModel = {}
				for own fieldItems of model.Fields.FieldItems
					parseModel[fieldItems.Name] = fieldItems.Value
				parsedResponse.push parsedModel
			parsedResponse
