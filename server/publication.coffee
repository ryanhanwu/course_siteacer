Meteor.publish 'websites', () ->
  [
    Websites.find()
  ]
