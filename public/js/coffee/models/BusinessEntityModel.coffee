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

        initialize: (options) ->

        parse: (resp) ->
            if resp?.Fields?
                parsedResp = id: resp.ID
                for field in resp.Fields.FieldItems
                    parsedResp[field.Name] = field.Value
                parsedResp
            resp

        toJSON: (options) ->
            fields = []
            for own key, value of @attributes
                fields.push
                    FieldDescriptorId: ''
                    Name: key
                    Value: value
                    OldValue: value
            ID: ''
            Fields:
                FieldItems: fields
