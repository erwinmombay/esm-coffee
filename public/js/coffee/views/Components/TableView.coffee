define (require) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    Handlebars = require('handlebars')

    tableTmpl = Handlebars.templates.TableView
    TableRowView = require 'cs!views/components/TableRowView'
    contextMenuView = require('cs!views/Components/ContextMenuView').instance

    tableHdrTmpl = '{{#each header}}<th>{{this}}</th>{{/each}}'

    class TreeView extends Backbone.View

        events:
            'click tr': '_onRowClick'

        initialize: (options) ->
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
            @$el.on 'contextmenu.treeview', 'tbody tr', @_onContextMenu
            @listenTo @_dataCollection, 'reset', @render
            @listenTo @_dataCollection, 'add', @addOne

        _unbindHandlers: ->
            @$el.off 'contextmenu.treeview', 'tbody tr', @_onContextMenu

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
            @$tbody.append row.render().$el

        addAll: ->
            @_dataCollection.each @addOne, @

        _onContextMenu: (e) =>
            if e.which is 3
                $curTarget = $ e.currentTarget
                e.preventDefault()
                e.stopPropagation()
                $curTarget.addClass 'table-manual-striped'
                contextMenuView.render
                    e: e
                    options: 'Edit': @_onRowEdit, 'Delete': @_onRowDelete
            # handle ctrl + lclick which triggers a contextmenu event, but do not
            # call `e.stopPropagation`
            else if e.which is 1 and e.ctrlKey is true
                e.preventDefault()
                e.stopPropagation()

        _onRowClick: (e) ->
            if e.which is 1
                $curTarget = $ e.currentTarget
                @_clearStripes() unless e.ctrlKey is true
                $curTarget.addClass 'table-manual-striped'

        _onRowEdit: (e) =>
            @trigger 'table:edit', ctx: @, e: e, data: @_getSelectedRowsByIds()

        _onRowDelete: (e) =>
            @trigger 'table:delete', ctx: @, e: e, data: @_getSelectedRowsByIds()

        _getSelectedRowsByIds: ->
            return (@_dataCollection.get($(cid).attr('data-cid')) for cid in @$ '.table-manual-striped')

        _clearStripes: ->
            @$('.table-manual-striped').removeClass 'table-manual-striped'
