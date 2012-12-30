define (require) ->
    Backbone = require 'backbone'
    Router = require 'cs!routers/Router'

    initialize: ->
        new Router()
        Backbone.history.start root: '/public/js/'
