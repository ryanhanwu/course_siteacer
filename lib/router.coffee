Router.configure
  progressSpinner : false
  layoutTemplate: 'layout'

Router.route 'index',
  path: '/'
  waitOn: () ->
    Meteor.subscribe "websites"
