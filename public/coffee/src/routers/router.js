/*global define:true, $:true, Backbone:true, _:true, Handlebars:true*/
define(function(require) {
    'use strict';
    var Backbone = require('backbone');
    var mainView = require('views/MainView').instance;

    var Router = Backbone.Router.extend({
        routes: {
        },

        initialize: function() {
            mainView.render();
        }
    });
    return Router;
});
