define(function(require) {
    'use strict';
    var $ = require('jquery');
    var _ = require('underscore');

    var BaseView = require('views/BaseView');

    var ContextMenuView = BaseView.extend({

        tagName: 'div',

        className: 'cmenu',

        isVisible: false,

        events: {
            'click li a': 'onClick'
        },

        initialize: function(options) {
            _.bindAll(this, 'hide');
            $('body').append(this.$el);
            this._isVisible = false;
            this.options = null;
            this.$options = null;

            this._bindHandlers();
        },

        _bindHandlers: function() {
            $(document).on('click contextmenu', this.hide);
        },

        _unbindHandlers: function() {
            $(document).off('click contextmenu', this.hide);
        },

        remove: function() {
            this.options = null;
            this._unbindHandlers();
            BaseView.prototype.remove.call(this);
        },

        render: function(spec) {
            this.options = null;
            this.hide();
            this.$el.css({
                'display': '',
                'position': 'absolute',
                'z-index': '1000',
                'left': spec.e.pageX + 'px',
                'top': spec.e.pageY + 'px',
                'height': '350px',
                'width': '150px'
            });
            this.$options = $('<ul/>', { 'class': 'cmenu-options' });
            this.options = spec.options;
            _.each(spec.options, this._createMenuListItems, this);
            this.$el.append(this.$options);
            this.$el.show();
            this._isVisible = true;
            return this;
        },

        hide: function() {
            this.options = null;
            if (this._isVisible) {
                this.$el.hide();
                this.$el.empty();
                this._isVisible = false;
            }
        },

        onClick: function(e) {
            this.options[$(e.currentTarget).text()](e);
            this.options = null;
        },

        _createMenuListItems: function(value, key) {
            var $listItem = $('<li/>');
            var $link = $('<a/>', { id: _.uniqueId('ctx_option_'), 'text': key });
            this.$options.append($listItem.append($link));
        }
    });
    return {
        instance: new ContextMenuView()
    };
});
