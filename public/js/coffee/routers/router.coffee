define (require) ->
    Backbone = require 'backbone'
    mainView = require('cs!views/MainView').instance

    class Router extends Backbone.Router

        initialize: ->
            mainView.render()
