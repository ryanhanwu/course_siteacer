Template.website_item.events
  'click .js-upvote': (event) ->
    website_id = @_id
    console.log 'Up voting website with id ' + website_id
    website = Websites.findOne website_id
    vote = website.vote + 1
    Websites.update website._id, $set: vote: vote
    false
    # prevent the button from reloading the page
  'click .js-downvote': (event) ->
    website_id = @_id
    console.log 'Down voting website with id ' + website_id
    website = Websites.findOne website_id
    vote = website.vote - 1
    Websites.update website._id, $set: vote: vote
    false
    # prevent the button from reloading the page

