define (require) ->
    $ = require 'jquery'
    _ = require 'underscore'

    BaseView = require 'cs!views/BaseView'

    class ContextMenuView extends BaseView

        tagName: 'div'

        className: 'cmenu'

        isVisible: false

        events:
            'click li a': 'onClick'

        initialize: (options) ->
            $('body').append @$el
            @_isVisible = false
            @options = null
            @$options = null

            @_bindHandlers()

        _bindHandlers: ->
            $(document).on 'click contextmenu', @hide

        _unbindHandlers: ->
            $(document).off 'click contextmenu', @hide

        remove: ->
            @options = null
            @_unbindHandlers()
            super()

        render: (spec) ->
            @options = null
            @hide()
            @$el.css
                'display': ''
                'position': 'absolute'
                'z-index': '1000'
                'left': spec.e.pageX + 'px'
                'top': spec.e.pageY + 'px'
                'height': '350px'
                'width': '150px'
            @$options = $ '<ul/>', 'class': 'cmenu-options'
            @options = spec.options
            _.each spec.options, @_createMenuListItems
            @$el.append @$options
            @$el.show()
            @_isVisible = true
            this

        hide: =>
            @options = null
            if @_isVisible
                @$el.hide()
                @$el.empty()
                @_isVisible = false

        onClick: (e) ->
            @options[$ e.currentTarget.text()] e
            @options = null

        _createMenuListItems: (value, key) =>
            $listItem = $ '<li/>'
            $link = $ '<a/>', id: _.uniqueId('ctx_option_'), 'text': key
            @$options.append $listItem.append($link)

    instance: new ContextMenuView()
