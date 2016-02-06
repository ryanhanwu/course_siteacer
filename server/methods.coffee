
Meteor.methods
  addSite: (target) ->
    website = {}
    website.url = target.url
    console.log "Adding", website.url
    result = HTTP.get website.url
    $ = cheerio.load result.content, xmlMode: true
    if target.title
      website.title = target.title
    else
      website.title = $('title').html() || "Unknown Title"

    if target.description
      website.description = target.description
    else
      description = [
        "Another awesome website!"
        $('p').first().html()
        $('meta[property="og:description"]').attr('content')
        $('meta[name="twitter:description"]').attr('content')
        $('meta[name="description"]').attr('content')
        $('meta[name="Description"]').attr('content')
        target.description
      ]
      next = true
      while (next)
        title = description.pop()
        if !!title
          website.description = title
          next = false
    imgs = [
      "http://placehold.it/350x150"
      $('img').first().attr('src')
      $('meta[name="og:image"]').attr('content')
      $('meta[name="twitter:image"]').attr('content')
    ]
    next = true
    while (next)
      img = imgs.pop()
      if !!img
        if img.startsWith("http")
          website.img = img
        else
          website.img = website.url + img
        next = false
    website.createdOn = new Date
    website.vote = 0
    Websites.insert website
