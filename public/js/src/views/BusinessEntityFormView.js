define(function(require) {
    'use strict';
    var _ = require('underscore');
    var BaseView = require('views/BaseView');

    var template = require('text!templates/BusinessEntityForm.html');

    var BusinessEntityFormView = BaseView.extend({

        id: 'business-entity-modal',

        initialize: function(options) {
            this.$el.modal({ keyboard: true, show: false });
            this.tmpl = Handlebars.compile(template);
            this.$body = null;
        },

        render: function(spec) {
            var item;
            var groups = [];
            this.$el.empty();
            if (spec && spec.model) {
                _.each(spec.model.attributes, function(value, key) {
                    item = {
                        id: _.uniqueId('formfield-'),
                        label: key,
                        type: 'text',
                        value: value,
                        placeholder: key + '...'
                    };
                    groups.push(item);
                });
                this.$el.append(this.tmpl({
                    groups: groups
                }));
            }
            return this;
        }
    });
    return BusinessEntityFormView;
});
