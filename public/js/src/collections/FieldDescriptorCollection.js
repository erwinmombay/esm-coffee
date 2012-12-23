define(function(require) {
    'use strict';
    var BaseCollection = require('collections/BaseCollection');
    var FieldDescriptorModel = require('models/FieldDescriptorModel');

    var FieldDescriptorCollection = BaseCollection.extend({

        url: 'api/fielddescriptor/',

        model: FieldDescriptorModel,

        parse: function(response) {
        }
    });
    return FieldDescriptorCollection;
});
