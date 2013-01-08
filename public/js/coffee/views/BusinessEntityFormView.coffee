define (require) ->
    _ = require 'underscore'
    BaseView = require 'cs!views/BaseView'
    template = require('handlebars').templates.BusinessEntityForm

    class BussinessEntityFormView extends BaseView

        id: 'business-entity-modal'

        initialize: (options) ->
            @$el.modal keyboard: true, show: false
            @model = null
            @tmpl = template

        render: (spec) ->
            groups = []
            @$el.empty()
            if spec?.model?
                @model = spec.model
                for own key, value of @model.attributes
                    groups.push
                        id: _.uniqueId 'formfield-'
                        label:
                            if spec.labels?[key]?
                            then spec.labels[key]
                            else key
                        type: 'text'
                        value: value
                        elemTarget: key
                        placeholder:
                            if spec.placeholders?[key]?
                            then spec.placeholders[key]
                            else key + '...'
                @$el.append(@tmpl groups: groups)
            this
