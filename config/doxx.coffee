path = require('path')

config = require('./index')
links = require('./links')

root = path.resolve(__dirname, '..')

module.exports = {
  docsExt: config.docsExt
  docsSource: path.join(root, config.docsSourceDir)
  docsDest: path.join(root, config.docsDestDir)
  metaExtra: (fileName, fileObj) ->
    improveDocsLink: "#{config.editPageLink}/#{config.docsSourceDir}/#{fileName}"
    $links: links
  layoutLocals: config.layoutLocals
  serializeNav: path.join(root, 'server', 'nav.json')
  buildLunrIndex: path.join(root, 'server', 'lunr_index.json')
}
