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
