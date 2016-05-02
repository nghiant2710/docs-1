config = require('./index')
links: require('./links')

module.exports = {
  docsExt: config.docsExt
  docsSource: config.docsSourceDir
  docsDest: config.docsDestDir
  metaExtra: (fileName, fileObj) ->
    improveDocsLink: "#{config.editPageLink}/#{config.docsSourceDir}/#{fileName}"
    $links: links
  layoutLocals:
    mainSiteUrl: MAIN_SITE
    dashboardUrl: DASHBOARD_SITE
    menuLinks: MAIN_MENU_LINKS
}
