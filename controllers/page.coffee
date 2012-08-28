###
 * Custom Pages
 *
 * Application Server
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
system = require '../system'

# Load in database models
models = 
 page: system.load.model 'page'
 user: system.load.model 'user'

# Load in classes
classes =
 user: system.load.class 'user'
 page: system.load.class 'page'

# Load in helpers
helpers =
  requireAuth: system.load.helper 'requireAuth'

exports.index = (req,res) ->
  
exports.view = (req,res) ->
  url = req.params
  
  models.page.getPageByUrl url, (err,results) ->
    if err then console.log err
    if results.length == 0
      if url.pop() is '/' then res.render 'errors/no_index' else res.render 'errors/404'
    else
      page = new classes.page results.pop()
      if page.restricted
        helpers.requireAuth req, res, ->
          res.render 'pages/page', objPage: page
      else
        res.render 'pages/page', objPage: page
        
exports.add = (req,res) ->
  
exports.create = (req,res) ->
  
exports.edit = (req,res) ->
  
exports.update = (req,res) ->

exports.destroy = (req,res) ->