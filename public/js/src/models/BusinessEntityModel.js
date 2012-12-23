define(function (require) {
    'use script';
    var _ = require('underscore');
    var BaseModel = require('models/BaseModel');

    var BusinessEntityModel = BaseModel.extend({

        defaults: {
            code: '',
            name: '',
            address1: '',
            address2: '',
            city: '',
            stateOrProvince: '',
            postalCode: '',
            country: '',
            primaryIndustry: '',
            parentID: '',
            edictTestEntity: ''
        },

        url: function() {
            return 'api/businessentity/' + this.id;
        },

        initialize: function(options) {
        },

        parse: function(response) {
            var parsedResponse;
            if (response.Fields) {
                parsedResponse = { id: response.ID };
                _.each(response.Fields.FieldItems, function(field) {
                    parsedResponse[field.Name] = field.Value;
                });
                return parsedResponse;
            }
            return response;
        }
    });
    return BusinessEntityModel;
});
