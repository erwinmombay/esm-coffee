define (require) ->
    _ = require 'underscore'
    BaseView = require 'cs!views/BaseView'

    class ModalView extends BaseView

        events:
            'click #modal-helper-save': '_onSave'
            'click #modal-helper-close': '_onCancel'

        initialize: (options) ->
            @$el.modal keyboard: true, show: false
            @$body = @$ '.modal-body'
            @_bindHandlers()

        _bindHandlers: ->
            @$el.on 'hidden', @_onHide

        _unbindHandlers: ->
            @$el.off 'hidden', @_onhide

        remove: ->
            @_unbindHandlers()
            super()

        render: (el) ->
            this

        reRender: (el) ->
            @$body.append el
            @show()
            this

        show: ->
            @$el.modal 'show'

        hide: ->
            @$el.modal 'hide'

        toggle: ->
            @$el.modal 'toggle'

        _onHide: (e) =>
            @trigger 'modal:hide', ctx: @, e: e

        _onSave: (e) ->
            @trigger 'modal:save', ctx: @, e: e

        _onCancel: (e) ->
            @trigger 'modal:cancel', ctx: @, e: e
