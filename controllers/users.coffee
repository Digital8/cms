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

models = 
 users: system.load.model 'user'

classes =
 user: system.load.class 'user'

exports.index = (req,res) ->
  
exports.view = (req,res) ->
  alias = req.params.alias
  models.users.getUserByAlias alias, (err, results) ->
    if err then throw err
    if results.length
      res.render 'user/profile', user: new classes.user(results.pop())
    else
      res.send 'error not found'
      
exports.add = (req,res) ->

exports.create = (req,res) ->
  
exports.edit = (req,res) ->
  
exports.update = (req,res) ->

exports.destroy = (req,res) ->