path = require('path')
express = require('express')
consolidate = require('consolidate')
_ = require('lodash')
doxx = require('@resin/doxx')
redirect = require('./redirect')
navTree = require('./nav.json')
config = require('../config')

app = express()

doxx.swig.configureExpress(app)

{ ACME_CHALLENGE, ACME_RESPONSE } = process.env
if ACME_CHALLENGE and ACME_RESPONSE
  app.use "/.well-known/acme-challenge/#{ACME_CHALLENGE}", (req, res) ->
    res.send(ACME_RESPONSE)

{ GOOGLE_VERIFICATION } = process.env
if GOOGLE_VERIFICATION
  if not GOOGLE_VERIFICATION.match(/\.html$/)
    GOOGLE_VERIFICATION += '.html'
  app.use "/#{GOOGLE_VERIFICATION}", (req, res) ->
    res.send("google-site-verification: #{GOOGLE_VERIFICATION}")

staticDir = path.join(__dirname, '..', 'static')
contentsDir = path.join(__dirname, '..', config.docsDestDir)

app.use(express.static(staticDir))

app.use (req, res, next) ->
  originalUrl = req.originalUrl
  url = redirect(originalUrl)
  if url isnt originalUrl
    return res.redirect(url)
  next()

getLocals = (extra) ->
  doxx.swig.getLocals({ nav: navTree }, extra)

doxx.lunr.loadIndex()

app.get '/search-results', (req, res) ->
  { searchTerm } = req.query
  res.render 'search', getLocals
    title: "Search results for \"#{searchTerm}\""
    breadcrumbs: [
      'Search Results'
      searchTerm
    ]
    searchTerm: searchTerm
    searchResults: doxx.lunr.seach(searchTerm)

app.use(express.static(contentsDir))

app.get '*', (req, res) ->
  res.render 'not-found', getLocals
    title: "We don't seem to have such page"
    breadcrumbs: [ 'Page not found' ]

port = process.env.PORT ? 3000

app.listen port, ->
  console.log("Server started on port #{port}")
