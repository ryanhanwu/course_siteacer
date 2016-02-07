Template.website_form.events
  'submit .js-save-website-form': (event) ->
    if User.isLoggedIn()
      target = event.target
      data =
        url: target.url.value
        description: target.description.value
        title: target.title.value
      if !!data.url && data.url.startsWith('http')
        NProgress.start()
        $('input').val("")
        Meteor.call "addSite", data, (err, response) ->
          NProgress.done()
        $("#url").parent().removeClass('has-error')
      else
        $("#url").parent().addClass('has-error')
    false
      # stop the form submit from reloading the page
