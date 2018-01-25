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
      styles: ["skel.css","style.css","style-xlarge.css", "local.css", "bootstrap.min.css", "bootstrap.css.map"]
      scripts: ["jquery.min.js","skel.min.js","skel-layers.min.js","init.js","local.js", "bootstrap.min.js"]
    styleTemplate: (style)->"<link rel=\"stylesheet\" type=\"text/css\" href=\"#{@site.url}/css/#{style}\"/>"
    scriptTemplate: (script)->"<script defer=\"defer\" src=\"#{@site.url}/js/#{script}\"></script>"
    getSiteStyles: ->
      @styleTemplate style for style in @site.styles
    getSiteScripts: ->
      @scriptTemplate script for script in @site.scripts
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getHeading1: -> if @document.heading1 then @document.heading1 else @site.heading1
    getHeading2: -> if @document.heading2 then @document.heading2 else @site.heading2
    getUrl: (document) ->
      return @site.url + (document.url)
    getBoxUrl: (title) ->
      boxPage = @getCollection("html").findAllLive({type:"rowcellPage", title: "#{title}"}).toJSON()[0]
      return @site.url + boxPage.url
    getMenus: (document) ->
      menu = @getCollection("html").findAllLive({type:"menu", title: "#{document.title}"}).toJSON()[0]
      if menu
        menu.url = if menu.firstUrl then menu.firstUrl else @getUrl(document)
        return menu
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
}
# Export the DocPad Configuration
module.exports = docpadConfig
