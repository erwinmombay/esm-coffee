/*global define: true*/
define(function (require) {
    'use script';
    var _ = require('underscore');

    var BaseCollection = require('collections/BaseCollection');
    var BusinessEntityModel = require('models/BusinessEntityModel');

    var BusinessEntityCollection = BaseCollection.extend({

        model: BusinessEntityModel,

        url: 'api/businessentity/',

        parse: function(response) {
            var parsedModel;
            var parsedResponse = [];
            _.each(response, function(model) {
                parsedModel = {};
                _.each(model.Fields.FieldItems, function(fieldItems) {
                    parsedModel[fieldItems.Name] = fieldItems.Value;
                });
                parsedResponse.push(parsedModel);
            });
            return parsedResponse;
        }
    });
    return BusinessEntityCollection;
});
