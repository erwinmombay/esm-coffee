/*global define:true*/
define(function(require) {
    'use strict';
    var Backbone = require('backbone');

    var Router = require('routers/router');

    return {
        initialize: function() {
            new Router();
            Backbone.history.start({ root: '/public/js/' });
        }
    };
});
