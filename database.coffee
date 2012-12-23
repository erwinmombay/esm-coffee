pg = require 'pg'

conString = 'postgresql+psycopg2://postgres:password@localhost:5432/postgres'

pgClient = exports.pgClient = new pg.Client process.env.DATABASE_URL || conString
pgClient.connect()
