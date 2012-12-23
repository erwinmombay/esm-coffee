express = require 'express'
routes = require './routes'
gzippo = require 'gzippo'

app = module.exports = express.createServer()
db = require './database'
pgClient = db.pgClient

allowCrossDomain = (req, res, next) ->
    res.header 'Access-Control-Allow-Origin', '*'
    res.header 'Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE'
    res.header 'Access-Control-Allow-Headers', 'Content-Type'
    next()

# Configuration
app.configure ->
    app.set 'views', __dirname + '/views'
    app.set 'view engine', 'jade'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use allowCrossDomain
    app.use app.router
    app.use express.static(__dirname + '/public')
    app.use gzippo.staticGzip(__dirname + '/public')
    app.use gzippo.compress()
    app.enable 'view cache'

app.configure 'development', ->
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true

app.configure 'production', ->
    app.set express.errorHandler()

# Routes
app.get '/', routes.index
app.get '/api/businessentity/', routes.document
app.get '/api/fielddescriptor/', routes.field

app.listen process.env.PORT || 5000
console.log "Express server listening on port %d in %s mode",
    app.address().port, app.settings.env
