define(function(require) {
    'use strict';
    var $ = require('jquery');
    var _ = require('underscore');
    var BaseView = require('views/BaseView');

    var ModalView = BaseView.extend({

        events: {
            'click #modal-helper-save': '_onSave',
            'click #modal-helper-close': '_onCancel'
        },

        initialize: function(options) {
            _.bindAll(this, '_onHide', '_onSave', '_onCancel');
            this.$el.modal({ keyboard: true, show: false });
            this.$body = this.$('.modal-body');

            this._bindHandlers();
        },

        _bindHandlers: function() {
            this.$el.on('hidden', this._onHide);
        },

        _unbindHandlers: function() {
            this.$el.off('hidden', this._onHide);
        },

        remove: function() {
            this._unbindHandlers();
            BaseView.prototype.remove.call(this);
        },

        render: function(body) {
            this.$body.empty();
            this.$body.append(body);
            this.show();
            return this;
        },

        show: function() {
            this.$el.modal('show');
        },

        hide: function() {
            this.$el.modal('hide');
        },

        toggle: function() {
            this.$el.modal('toggle');
        },

        _onHide: function() {
            this.trigger('modal:hide');
        },

        _onSave: function(e) {
            this.trigger('modal:save', { ctx: this, e: e });
        },

        _onCancel: function(e) {
            this.trigger('modal:cancel', { ctx: this, e: e });
        }
    });

    return ModalView;
});
