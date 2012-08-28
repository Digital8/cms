###
 * Members
 *
 * Allows the modification, creation and deletion of members
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

system = require '../system'

# Load in database models
models = 
  user: system.load.model 'user'

# Load in classes
classes = 
  user: system.load.class 'user'

# GET
exports.index = (req,res) ->
  models.user.findAll (err, memberResults) ->
    if err then throw err
    i = 0
    members = []
    for [0...memberResults.length]
      members[i] = new classes.user memberResults[i]
      i++
    res.render 'administration/members/index', members: members
  
# GET
exports.view = (req,res) ->

# GET
exports.add = (req,res) ->

# POST
exports.create = (req,res) ->

# GET
exports.edit = (req,res) ->

# PUT
exports.update = (req,res) ->

# DEL
exports.destroy = (req,res) ->