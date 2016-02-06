Template.website_item.helpers
  created: (date) ->
    moment(date).fromNow()
  isLogin: () ->
    !!Meteor.users.findOne()

Template.website_list.helpers
  websites: ->
    Websites.find {}, sort: vote: -1

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


Template.website_form.events
  'click .js-toggle-website-form': (event) ->
    $('#website_form').toggle 'slow'

  'submit .js-save-website-form': (event) ->
    target = event.target
    data =
      url: target.url.value
      description: target.description.value
      title: target.title.value
    if !!target.url.value
      NProgress.start()
      Meteor.call "addSite", data, (err, response) ->
        NProgress.done()
        $('#website_form').toggle 'slow'
    false
    # stop the form submit from reloading the page
