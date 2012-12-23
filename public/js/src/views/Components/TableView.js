define(function(require) {
    'use script';
    var _ = require('underscore');
    var Backbone = require('backbone');

    var tableTmpl = require('text!templates/TableView.html');
    var TableRowView = require('views/components/TableRowView');
    var contextMenuView = require('views/Components/ContextMenuView').instance;

    var tableHdrTmpl = '{{#each header}}<th>{{this}}</th>{{/each}}';

    var TreeView = Backbone.View.extend({

        initialize: function(options) {
            _.bindAll(this, '_onContextMenu');
            this._headerNames = null;
            this._attrMap = null;
            this._dataCollection = null;

            this.$thead = null;
            this.$tbody = null;

            if (options) {
                this._headerNames = options.headerNames;
                this._attrMap = options.attrMap;
                this._dataCollection = options.dataCollection;
            }

            this._dataCollection = this._dataCollection || new Backbone.Collection();
            this._bindHandlers();
        },

        _bindHandlers: function() {
            this.$el.on('contextmenu', 'tbody tr', this._onContextMenu);
            this.listenTo(this._dataCollection, 'reset', this.render);
            this.listenTo(this._dataCollection, 'add', this.addOne);
        },

        _unbindHandlers: function() {
            this.$el.off('contextmenu', 'tr', this._onContextMenu);
        },

        remove: function() {
            this._unbindHandlers();
            Backbone.View.prototype.remove.call(this);
        },

        render: function() {
            this.$el.empty();
            var hdrTmplComp = Handlebars.compile(tableHdrTmpl);
            var hdr = hdrTmplComp({ header: this._headerNames });
            this.$el.append(tableTmpl);
            this.$thead = this.$('thead > tr');
            this.$tbody = this.$('tbody');
            this.$thead.append(hdr);

            this.addAll();
            return this;
        },

        addOne: function(model) {
            var row = new TableRowView({
                model: model,
                attrMap: this._attrMap || this._headerNames
            });
            row.render();
            this.$tbody.append(row.$el);
        },

        addAll: function() {
            this._dataCollection.each(this.addOne, this);
        },

        _onContextMenu: function(e) {
            e.preventDefault();
            e.stopPropagation();
            contextMenuView.render({
                e: e,
                options: {
                    'Edit': function(e) {
                        console.log('edit');
                    },
                    'Delete': function(e) {
                        console.log('demo');
                    }
                }
            });
        }
    });
    return TreeView;
});
