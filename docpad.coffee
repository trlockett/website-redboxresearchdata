# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
  templateData:
    site:
      title: "ReDBox: Research Data Box"
      heading1: "ReDBox"
      heading2: "Research Data Box"
      url: 'https://redbox-mint.github.io/website-redboxresearchdata'
      # for CDN
      styles: []
      scripts: []
    getSiteStyles: ->
      for style in @site.styles
        return "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{style}\">"
    getSiteScripts: ->
      for script in @site.scripts
        return "<script defer=\"defer\" src=\"#{script}\"></script>"
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getHeading1: -> if @document.heading1 then @document.heading1 else @site.heading1
    getHeading2: -> if @document.heading2 then @document.heading2 else @site.heading2
    getUrl: (document) ->
      updatedUrl = @site.url + document.url
      return updatedUrl
    getBoxUrl: (title) ->
      boxPage = @getCollection("html").findAllLive({type:"rowcellPage", title: "#{title}"}).toJSON()[0]
      return @site.url + boxPage.url
    getMenus: (document) ->
      menu = @getCollection("html").findAllLive({type:"menu", title: "#{document.title}"}).toJSON()[0]
      if menu
        menu.url = if menu.firstUrl then menu.firstUrl else @getUrl(document)
        return menu
    getCleanUrls: (document) ->
      url = '/website-redboxresearchdata' + document
      title = document.split('/').join('')
      return """
             <!DOCTYPE html>
             <html>
             	<head>
             		<title>#{title or 'Redirect'}</title>
             		<meta http-equiv="REFRESH" content="0;url=#{url}">
             		<link rel="canonical" href="#{url}" />
             	</head>
             	<body>
             		This page has moved. You will be automatically redirected to its new location. If you aren't forwarded to the new page, <a href="#{url}">click here</a>.
             	</body>
             </html>
             """
  collections:
    navigablePages: -> @getCollection("html").findAllLive({type:"navigablePage"},[{order:1}]).on "add", (model) ->
      model.setMetaDefaults({layout:"generic"})
    rowcells: -> @getCollection("html").findAllLive({type:"rowcell"},[{order:1}]).on "add", (model) ->
      model.setMetaDefaults({layout:"box"})
  environments:
    development:
      templateData:
        site:
          url: 'http://localhost:9778'
  plugins:
    consolidate:
      eco: true
    cleanurls:
      trailingSlashes: true
      getRedirectTemplate: (doc) -> @docpad.getConfig().templateData.getCleanUrls(doc)
      advancedRedirects:[
        [/^https:\/\/redbox-mint\.github\.io\/images\/(.*)$/, 'https://redbox-mint.github.io/website-redboxresearchdata/images/$1']
        [/^https:\/\/redbox-mint\.github\.io\/css\/(.*)$/, 'https://redbox-mint.github.io/website-redboxresearchdata/css/$1']
        [/^https:\/\/redbox-mint\.github\.io\/js\/(.*)$/, 'https://redbox-mint.github.io/website-redboxresearchdata/js/$1']
        [/^https:\/\/redbox-mint\.github\.io\/fonts\/(.*)$/, 'https://redbox-mint.github.io/website-redboxresearchdata/fonts/$1']
      ]
}
# Export the DocPad Configuration
module.exports = docpadConfig
