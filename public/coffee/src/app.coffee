define ->
    Backbone = require 'backbone'
    Router = require 'Router'

    initialize: ->
        new Router()
        Backbone.history.start root: '/public/js/'
