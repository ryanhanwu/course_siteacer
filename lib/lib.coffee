@Websites = new (Mongo.Collection)('websites')
@Comments = new (Mongo.Collection)('comments')
@Votes = new (Mongo.Collection)('vote')

@WebsitesIndex = new EasySearch.Index
  collection: Websites
  fields: ['title', 'description']
  engine: new EasySearch.Minimongo
    sort: () ->
      {"vote": -1}

Websites.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId

Websites.deny
  insert: (userId, doc) ->
    !userId
  update: (userId, doc, fieldNames, modifier) ->
    !userId
  remove: (userId, doc) -> true

Comments.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    !!userId and doc.createdBy is userId
  remove: (userId, doc) ->
    !!userId and doc.createdBy is userId

Comments.deny
  insert: (userId, doc) ->
    !userId
  update: (userId, doc, fieldNames, modifier) ->
    !userId
  remove: (userId, doc) -> true

Votes.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) -> false
  remove: (userId, doc) ->
    !!userId and doc.createdBy is userId

Votes.deny
  insert: (userId, doc) ->
    !userId
  update: (userId, doc, fieldNames, modifier) ->
    !userId
  remove: (userId, doc) ->
    !userId and doc.createdBy is userId

@User =
  isLoggedIn: () ->
    !!Meteor.users.findOne()
  current: () ->
    Meteor.users.findOne()
