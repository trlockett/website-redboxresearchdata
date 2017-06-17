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
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getHeading1: -> if @document.heading1 then @document.heading1 else @site.heading1
    getHeading2: -> if @document.heading2 then @document.heading2 else @site.heading2
    getUrl: (document) ->
            return @site.url + (document.url)
  collections:
      pages: -> @getCollection("html").findAllLive({type:"page"},[{order:1}]).on "add", (model) ->
        model.setMetaDefaults({layout:"generic"})
      indexrow: -> @getCollection("html").findAllLive({type:"indexrow"},[{order:1}]).on "add", (model) ->
        model.setMetaDefaults({layout:"box"})
  environments:
        development:
            templateData:
                site:
                    url: 'http://localhost:9778'

}

# Export the DocPad Configuration
module.exports = docpadConfig
