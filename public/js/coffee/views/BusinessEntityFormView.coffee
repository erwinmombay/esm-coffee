define (require) ->
    _ = require 'underscore'
    BaseView = require 'cs!views/BaseView'
    template = require('handlebars').templates.BusinessEntityForm

    class BussinessEntityFormView extends BaseView

        id: 'business-entity-modal'

        initialize: (options) ->
            @$el.modal keyboard: true, show: false
            @tmpl = template
            @$body = null

        render: (spec) ->
            groups = []
            @$el.empty()
            if spec?.model?
                for own key, value of spec.model.attributes
                    item =
                        id: _.uniqueId 'formfield-'
                        label: key
                        type: 'text'
                        value: value
                        placeholder: key + '...'
                    groups.push item
                @$el.append(@tmpl groups: groups)
            this
