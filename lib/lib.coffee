@Websites = new (Mongo.Collection)('websites')
@Comments = new (Mongo.Collection)('comments')

Websites.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId

Websites.deny
  insert: (userId, doc) -> true
  update: (userId, doc, fieldNames, modifier) ->
    !userId
  remove: (userId, doc) -> true

Comments.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId and doc.creator is userId
  remove: (userId, doc) ->
    !!userId and doc.creator is userId

Comments.deny
  insert: (userId, doc) -> true
  update: (userId, doc, fieldNames, modifier) -> true
  remove: (userId, doc) -> true

@User =
  isLoggedIn: () ->
    !!Meteor.users.findOne()
