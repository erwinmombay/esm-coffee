define (require) ->
    $ = require 'jquery'
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
            @collection2 = new FieldDescriptorCollection()
            @fieldset = new BusinessEntityFormView()
            @_bindHandlers()

        _bindHandlers: ->
            @listenTo @modalView, 'modal:save', @_onModalSave
            @listenTo @modalView, 'modal:cancel', @_onModalCancel

        render: ->
            buttons = """
                <p>
                    <button id="add-entity" type="button" class="btn btn-primary">Add</button>
                    <button id="fetch-collection" type="button" class="btn">Fetch</button>
                    <button id="reset-collection" type="button" class="btn">Reset</button>
                </p>
            """
            @$el.append buttons
            tbl = new TableView
                dataCollection: @collection
                headerNames: ['code', 'name', 'address1', 'state/province', 'zip']
                attrMap: ['code', 'name', 'address1', 'stateOrProvince', 'postalCode']
            @$el.append tbl.render().$el
            this

        _addEntity: (e) ->
            @modalView.render(@fieldset.render(model: new BusinessEntityModel()).$el)

        _fetchCollection: (e) ->
            @collection.fetch()

        _resetCollection: (e) ->
            @collection.reset()

        _onModalSave: ->

        _onModalCancel: ->

    instance: new MainView(el: $ '#main-view')
