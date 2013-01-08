define (require) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    modalHelperTmpl = require('handlebars').templates.Modal

    TableView = require 'cs!views/components/TableView'
    BusinessEntityModel = require 'cs!models/BusinessEntityModel'
    BusinessEntityCollection = require 'cs!collections/BusinessEntityCollection'
    FieldDescriptorCollection = require 'cs!collections/FieldDescriptorCollection'
    ModalView = require 'cs!views/ModalView'
    BusinessEntityFormView = require 'cs!views/BusinessEntityFormView'

    class MainView extends Backbone.View

        events:
            'click #add-entity': '_addEntity'
            'click #fetch-collection': '_fetchCollection'
            'click #reset-collection': '_resetCollection'

        initialize: (options) ->
            $('body').append modalHelperTmpl
            @modalView = new ModalView el: $ '#modal-helper'
            window.collection = @collection = new BusinessEntityCollection()
            @editor = new BusinessEntityFormView()
            @tbl = new TableView
                dataCollection: @collection
                attrMap: ['code', 'name', 'address1', 'stateOrProvince', 'postalCode']
                headerNames: ['code', 'name', 'address1', 'state/province', 'zip']
            @_bindHandlers()

        _bindHandlers: ->
            @listenTo @modalView, 'modal:save', @_onModalSave
            @listenTo @modalView, 'modal:cancel', @_onModalCancel
            @listenTo @modalView, 'modal:hide', @_onModalHide
            @listenTo @tbl, 'table:edit', @_onTableEdit
            @listenTo @tbl, 'table:delete', @_onTableDelete

        remove: ->
            @editor.stopListening()
            super()

        render: ->
            buttons = """
                <p>
                    <button id="add-entity" type="button" class="btn btn-primary">Add</button>
                    <button id="fetch-collection" type="button" class="btn">Fetch</button>
                    <button id="reset-collection" type="button" class="btn">Reset</button>
                </p>
            """
            @$el.append buttons
            @$el.append @tbl.render().$el
            this

        _addEntity: (e) ->
            @modalView.reRender(@editor.render(model: new BusinessEntityModel()).$el)

        _fetchCollection: (e) ->
            @collection.fetch()

        _resetCollection: (e) ->
            @collection.reset()

        _onModalSave: ->
            if @editor.model?
                data = @editor.$ 'input[data-target]'
                for val in data
                    $val = $ val
                    target = $val.attr 'data-target'
                    text = $val.val()
                    @editor.model.set target, text if text
                @editor.model.save null,
                    success: (model, resp, options) =>
                        model.set 'id', resp.id
                        @collection.add model
                        @modalView.hide()
                    error: (model, xhr, options) =>
                @editor.model = null

        _onModalCancel: (e) ->
            @editor.model.destroy() if @editor.model?
            @editor.model = null

        _onModalHide: (e) ->
            @editor.model.destroy() if @editor.model?
            @editor.model = null

        _onTableEdit: (spec) =>
            labels =
                address1: 'address 1'
                address2: 'address 2'
                stateOrProvince: 'state'
                postalCode: 'zip'
                primaryIndustry: 'primary industry'
                parentID: 'parent id'
                edictTestEntity: 'edict test entity'
            if spec.data.length > 1
                @modalView.reRender(@bulkEditor.render(data: spec.data).$el)
            else
                @modalView.reRender(
                    @editor.render
                        model: spec.data[0]
                        labels: labels
                        placeholders: labels
                    .$el
                )

        _onTableDelete: (spec) =>
            _.each spec.data, (model) -> model.destroy()

    instance: new MainView(el: $ '#main-view')
