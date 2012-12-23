define (require) ->
    BaseCollection = require 'collections/BaseCollection'
    FieldDescriptorModel = require 'models/FieldDescriptorModel'

    class FieldDescriptorCollection extends BaseCollection

        url: 'api/fielddescriptor/'

        model: FieldDescriptorModel

        parse: (response) ->
