define(function(require) {
    'use script';
    var $ = require('jquery');
    window.$ = $
    var _ = require('underscore');
    var Backbone = require('backbone');
    var Handlebars = require('handlebars');
    var JST = require('JST');
    //var kendo = require('kendo');
    //var kendoBackbone = require('kendoBackbone');

    //: plugins
    var modalPlugin = require('modalPlugin');
    var xdomain = require('xdomain');
    var App = require('cs!app');
    App.initialize()
});
