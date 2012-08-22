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

# GET
exports.index = (req,res) ->
  
# GET
exports.view = (req,res) ->
  url = req.params
  
  models.page.getPageByUrl url, (err,results) ->
    if err then console.log err
    if results.length == 0
      res.render 'errors/404'
    else
      page = new classes.page results.pop()
      if page.restricted
        helpers.requireAuth req, res, ->
          res.render 'page', objPage: page
      else
        res.render 'page', objPage: page

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