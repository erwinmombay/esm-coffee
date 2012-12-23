define (require) ->
    $ = require 'jquery'
    xdomain = require 'xdomain'
    window.$ = $
    _ = require 'underscore'
    Backbone = require 'backbone'
    Handlebars = require 'handlebars'
    kendo = require 'kendo'
    kendoBackbone = require 'kendoBackbone'
    App = require 'app'
    modalPlugin = require 'modalPlugin'

    App.initialize()
