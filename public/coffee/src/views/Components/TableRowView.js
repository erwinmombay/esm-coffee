define(function(require) {
    'use script';
    var Backbone = require('backbone');
    
    var TableRowView = Backbone.View.extend({
        tagName: 'tr',

        initialize: function(options) {
            this.model.on('change', this.render, this);
            this.model.on('destroy', this.remove, this);
            this._attrMap = options && options.attrMap || null;
            this._optionsCol = options && options.optionsCol || false;
        },

        render: function() {
            var i, l, col;
            this.$el.empty();
            if (this._attrMap) {
                for (i = 0, l = this._attrMap.length; i < l; i++) {
                    this.$el.append( this.model.has(this._attrMap[i]) ?
                        '<td class="span2">' + this.model.get(this._attrMap[i]) + '</td>'
                        : '<td class="span2"></td>'
                    );
                }
            }
            if (this._optionsCol) {
                this.$el.append('<td class="span1">options</td>');
            }
            return this;
        }
    });
    return TableRowView;
});
