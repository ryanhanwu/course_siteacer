Meteor.publish 'websites', () ->
  [
    Websites.find()
  ]

Meteor.publish 'website', (website_id) ->
  [
    Websites.find website_id
    Comments.find website: website_id
  ]
