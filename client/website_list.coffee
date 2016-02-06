
Template.website_list.helpers
  websites: ->
    Websites.find {}, sort: vote: -1

