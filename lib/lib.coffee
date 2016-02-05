@Websites = new (Mongo.Collection)('websites')
@Comments = new Mongo.Collection('comments');

Websites.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId
  remove: (userId, doc) ->
    !!userId

Websites.deny
  remove: (userId, doc) -> true

Comments.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId
  remove: (userId, doc) ->
    !!userId

Comments.deny
  remove: (userId, doc) -> true
