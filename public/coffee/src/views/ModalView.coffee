define (require) ->
	$ = require 'jquery'
	_ = require 'underscore'
	BaseView = require 'views/BaseView'

	class ModalView extends BaseView

		events:
			'click #modal-helper-save': '_onSave'
			'click #modal-helper-close': '_onCancel'

		initialize: (options) ->
			_.bindAll @, '_onHide', '_onSave', '_onCancel'
			@$el.modal keyboard: true, show: false
			@$el.$body = @$ '.modal-body'
			@_bindHandlers()

		_bindHandlers: ->
			@$el.on 'hidden', @_onHide

		_unbindHandlers: ->
			@$el.off 'hidden', @_onhide

		remove: ->
			@_unbindHandlers()
			super()

		render: ->
			@$body.empty()
			@$body.append body
			@show()
			@

		show: ->
			@$el.modal 'show'

		hide: ->
			@$el.modal 'hide'

		toggle: ->
			@$el.modal 'toggle'

		_onHide: ->
			@trigger 'modal:hode'

		_onSave: (e) ->
			@trigger 'modal:save',  ctx: @, e: e

		_onCancel: (e) ->
			@trigger 'modal:cancel', ctx: @, e: e
