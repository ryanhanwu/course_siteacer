Meteor.startup ->
  # code to run on server at startup
  if !Websites.findOne()
    Meteor.call 'addSite', url: 'https://www.codeschool.com/'
    Meteor.call 'addSite', url: 'https://www.codecademy.com/'
    Meteor.call 'addSite', url: 'https://www.edx.org/'
    Meteor.call 'addSite', url: 'https://university.mongodb.com/'
    Meteor.call 'addSite', url: 'https://github.com/'
    Meteor.call 'addSite', url: 'https://www.meetselect.com/'
    Meteor.call 'addSite', url: 'https://medium.com/'
    Meteor.call 'addSite', url: 'https://www.techinasia.com/'
    Meteor.call 'addSite', url: 'http://www.apple.com/'
    Meteor.call 'addSite', url: 'https://www.google.com/'
