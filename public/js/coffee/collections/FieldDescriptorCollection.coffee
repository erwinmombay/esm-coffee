define (require) ->
    BaseCollection = require 'cs!collections/BaseCollection'
    FieldDescriptorModel = require 'cs!models/FieldDescriptorModel'

    class FieldDescriptorCollection extends BaseCollection

        url: 'api/fielddescriptor'

        model: FieldDescriptorModel

        parse: (response) ->
