doxx = require('@resin/doxx')
doxxConfig = require('../config/doxx')

console.log('Building static HTML...')
doxx(doxxConfig)
.build (err) ->
  throw err if err
  console.log('Done')
