define (require) ->
    _ = require 'underscore'
    Backbone = require 'backbone'
    Handlebars = require('handlebars')

    tableTmpl = Handlebars.templates.TableView
    TableRowView = require 'cs!views/components/TableRowView'
    contextMenuView = require('cs!views/Components/ContextMenuView').instance

    tableHdrTmpl = '{{#each header}}<th>{{this}}</th>{{/each}}'

    class TreeView extends Backbone.View

        initialize: (options) ->
            _.bindAll @, '_onContextMenu'
            @_headerNames = null
            @_attrMap = null
            @_dataCollection = null

            @$thead = null
            @$tbody = null

            if options
                @_headerNames = options.headerNames
                @_attrMap = options.attrMap
                @_dataCollection = options.dataCollection

            @_dataCollection = @_dataCollection || new Backbone.Collection()
            @_bindHandlers()

        _bindHandlers:->
            @$el.on 'contextmenu', 'tbody tr', @_onContextMenu
            @listenTo @_dataCollection, 'reset', @render
            @listenTo @_dataCollection, 'add', @addOne

        _unbindHandlers: ->
            @$el.off 'contextmenu', 'tr', @_onContextMenu

        remove: ->
            @_unbindHandlers()
            super()

        render: ->
            @$el.empty()
            hdrTmplComp = Handlebars.compile(tableHdrTmpl)
            hdr = hdrTmplComp header: @_headerNames
            @$el.append tableTmpl
            @$thead = @$ 'thead > tr'
            @$tbody = @$ 'tbody'
            @$thead.append hdr

            @addAll()
            this

        addOne: (model) ->
            row = new TableRowView
                model: model
                attrMap: @_attrMap || @_headerNames
            row.render()
            @$tbody.append row.$el

        addAll: ->
            @_dataCollection.each @addOne, @

        _onContextMenu: (e) =>
            e.preventDefault()
            e.stopPropagation()
            contextMenuView.render
                e: e
                options:
                    'Edit': (e) ->
                        console.log('edit')
                    'Delete': (e) ->
                        console.log('demo')
