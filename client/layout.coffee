Template.layout.helpers
  transition: () ->
    (from, to, element) ->
      with: 'slide-height'
  searchAttributes: class: 'form-control', placeholder: 'Search'

Template.registerHelper "isLoggedIn", () ->
  User.isLoggedIn()

Template.registerHelper "createdFromNow", (date) ->
  moment(date).fromNow()

Template.registerHelper "websiteIndex", WebsitesIndex


