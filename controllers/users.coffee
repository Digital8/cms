###
 * Users Controller
 *
 * Controller for user account related activities
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

system = require '../system'

# Load in database models
models = 
 users: system.load.model 'user'

classes =
 user: system.load.class 'user'

# GET
exports.index = (req,res) ->
  
# GET
exports.view = (req,res) ->
  alias = req.params.alias
  models.users.getUserByAlias alias, (err, results) ->
    if err then throw err
    if results.length
      res.render 'user/profile', user: new classes.user(results.pop())
    else
      res.send 'error not found'

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