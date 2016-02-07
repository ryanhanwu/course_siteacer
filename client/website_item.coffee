Template.website_item.events
  'click .js-upvote': (event) ->
    if User.isLoggedIn()
      website_id = @_id
      console.log 'Up voting website with id ' + website_id
      website = Websites.findOne website_id
      vote = website.vote + 1
      Websites.update website._id, $set: vote: vote
    else
      sAlert.warning 'You have to sign in to vote'
    false
    # prevent the button from reloading the page
  'click .js-downvote': (event) ->
    if User.isLoggedIn()
      website_id = @_id
      console.log 'Down voting website with id ' + website_id
      website = Websites.findOne website_id
      vote = website.vote - 1
      Websites.update website._id, $set: vote: vote
    else
      sAlert.warning 'You have to sign in to vote'
    false
    # prevent the button from reloading the page

