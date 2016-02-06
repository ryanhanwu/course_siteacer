Template.layout.helpers
  transition: () ->
    (from, to, element) ->
      with: 'slide-height'

Template.registerHelper "isLoggedIn", () ->
  User.isLoggedIn()

Template.registerHelper "createdFromNow", (date) ->
  moment(date).fromNow()
