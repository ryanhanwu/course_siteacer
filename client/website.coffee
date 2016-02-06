Template.website.events
  'submit .js-comment-website-form': (event, tpl) ->
    if User.isLoggedIn()
      target = event.target
      website = tpl.data
      user = User.current()
      Comments.insert
        content: target.content.value
        website: website._id
        createdOn: new Date
        createdBy: user._id
    false
