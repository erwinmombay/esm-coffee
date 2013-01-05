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
                    item =
                        id: _.uniqueId 'formfield-'
                        label: key
                        type: 'text'
                        value: value
                        elemTarget: key
                        placeholder: key + '...'
                    groups.push item
                @$el.append(@tmpl groups: groups)
            this

        assign: ->

