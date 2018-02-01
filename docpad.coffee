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
      styles: ['css/skel.css','css/style.css','css/style-xlarge.css','css/local.css','css/bootstrap.min.css','css/bootstrap.css.map']
      scripts: ['js/jquery.min.js','js/skel.min.js','js/skel-layers.min.js','js/init.js','js/local.js','js/bootstrap.min.js']
    # scriptTemplate: (script) -> "<script defer=\"defer\" src=\"#{@site.url}/js/#{script}\"></script>"
    # styleTemplate: (style) -> "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{@site.url}/css/#{style}\">"
    # getSiteScripts: -> (@scriptTemplate script for script in @site.scripts).join("")
    # getSiteStyles: -> (@styleTemplate style for style in @site.styles).join("")
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getHeading1: -> if @document.heading1 then @document.heading1 else @site.heading1
    getHeading2: -> if @document.heading2 then @document.heading2 else @site.heading2
    getDocUrl: (document) ->
      updatedUrl = @site.url + document.url
      return updatedUrl
    getUrl: (path) ->
      if (path.indexOf('/') != 0)
        path = '/' + path
      return @site.url + path
    getAllUrls: (paths) ->
      results = (@getUrl path for path in paths)
      console.log('results are ')
      console.log(results)
      return results
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
}
# Export the DocPad Configuration
module.exports = docpadConfig
