Router.configure
  progressSpinner : false
  layoutTemplate: 'layout'

Router.route 'index',
  path: '/'
  waitOn: () ->
    Meteor.subscribe "websites"

Router.route 'website',
  path: '/site/:_id-:slug?'
  waitOn: () ->
    Meteor.subscribe "website", @params._id
  data: () ->
    if @ready()
      website = Websites.findOne @params._id
      cursor = Comments.find(
        {
          website: website._id
        },
        {
          sort: createdOn: -1
        })
      website.comments = cursor.fetch()
      website
