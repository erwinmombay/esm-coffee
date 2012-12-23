define (require) ->
    $ = require 'jquery'
    Backbone = require 'backbone'
    modalHelperTmpl = require 'text!templates/Modal.html'

    TableView = require 'views/components/TableView'
    BusinessEntityModel = require 'models/BusinessEntityModel'
    BusinessEntityCollection = require 'collections/BusinessEntityCollection'
    FieldDescriptorCollection = require 'collections/FieldDescriptorCollection'
    ModalView = require 'views/ModalView'
    BusinessEntityFormView = require 'views/BusinessEntityFormView'

    class MainView extends Backbone.View

        events:
            'click #add-entity': '_addEntity'
            'click #fetch-collection': '_fetchCollection'
            'click #reset-collection': '_resetCollection'

        initialize: (options) ->
            $('body').append modalHelperTmpl
            @modalView = new ModalView el: $ '#modal-helper'
            @collection = new BusinessEntityCollection()
            @collection2 = new FieldDescriptorCollection()
            @fieldset = new BusinessEntityFormView()
            @_bindHandlers()

        _bindHandlers: ->
            @listenTo(@modalView, 'modal:save', @_onModalSave)
            @listenTo(@modalView, 'modal:cancel', @_onModalCancel)

        render: ->
            buttons = """
                <button id="#add-entity" type="button" class="btn btn-primary">Add</button>
                <button id="#fetch-collection" type="button" class="btn">Fetch</button>
                <button id="#reset-collection" type="button" class="btn">Reset</button>
            """
            @$el.append buttons
            tbl = new TableView
                dataCollection: @collection
                headerNames: ['code', 'name', 'address1', 'state/province', 'zip']
                attrMap: ['code', 'name', 'address1', 'stateOrProvince', 'postalCode']
            @$el.append tbl.render().$el
            this

        _addEntity: ->
            @modalView.render(@fieldset.render(modal: new BusinessEntityModel()).$el)

        _fetchCollection: ->
            @collection.fetch()

        _resetCollection: ->
            @collection.reset()

        _onModalSave: ->

        _onModalCancel: ->

    instance: new MainView(el: $ '#main-view')
