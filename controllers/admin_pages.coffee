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

# GET
exports.add = (req,res) ->

# POST
exports.create = (req,res) ->

# GET
exports.edit = (req,res) ->
  url = req.params.id
  models.page.getPageByUrl "/#{url}", (err, page) ->
    if err then throw err
    page = new classes.page page.pop()
    res.render 'administration/pages/edit', page: page

# PUT
exports.update = (req,res) ->
  console.log req.body
  req.flash('info','some message here')
  res.redirect 'back'

# DEL
exports.destroy = (req,res) ->