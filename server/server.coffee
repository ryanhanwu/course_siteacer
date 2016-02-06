Meteor.startup ->
  # code to run on server at startup
  if !Websites.findOne()
    Meteor.call 'addSite', url: 'https://www.codeschool.com/'
    Meteor.call 'addSite', url: 'https://www.codecademy.com/'
    Meteor.call 'addSite', url: 'https://www.edx.org/'
    Meteor.call 'addSite', url: 'https://university.mongodb.com/'
    Meteor.call 'addSite', url: 'https://github.com/'
