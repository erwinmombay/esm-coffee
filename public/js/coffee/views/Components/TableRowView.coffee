define (require) ->
    Backbone = require 'backbone'

    class TableRowView extends Backbone.View

        tagName: 'tr'

        initialize: (options) ->
            @_attrMap = options && options.attrMap || null
            @_optionsCol = options && options.optionsCol || false

            @$el.attr('data-cid', @model.cid)
            @_bindHandlers()

        _bindHandlers: ->
            @listenTo @model, 'change', @render
            @listenTo @model, 'destroy', @remove

        remove: ->
            @$el.fadeOut duration: 'slow'
            super()

        render: ->
            @$el.empty()
            if @_attrMap
                for attr in @_attrMap
                    if @model.has attr
                        @$el.append "<td class=\"span2\">#{@model.get attr}</td>"
                    else
                        @$el.append '<td class="span2"></td>'
            if @_optionsCol
                @$el.append('<td class="span1">options</td>')
            this
