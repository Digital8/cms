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
fs = require 'fs'

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

controllers = []
fs.readdirSync("./controllers").forEach (module) -> 
  if module.split('.')[0] != '__skeleton' then controllers.push(module.split('.')[0])
  
# GET
exports.index = (req,res) ->
  models.page.getAllPages (err, pageResults) ->
    pages = []
    i=0
  
    # Create a page object of each page
    for [0...pageResults.length]
      pages[i] = new classes.page pageResults[i]
      i++
    
    res.render 'administration/pages/index', pages: pages or {}
  
# GET
exports.view = (req,res) ->

# GET
exports.add = (req,res) ->

# POST
exports.create = (req,res) ->

# GET
exports.edit = (req,res) ->
  id = req.params.id
  models.page.getPageById id, (err, page) ->
    if err then throw err
    if page.length is 0
      req.flash('error','Page doesn\'t exist')
    else
      page = new classes.page page.pop()
        
    res.render 'administration/pages/edit', page: page or {}, controllers: controllers

# PUT
exports.update = (req,res) ->
  fields = req.body
  fields.id = req.params.id
  
  models.page.update fields, (err, results) ->
    if err 
      req.flash('error', "DB Error: #{err.code}")
    else
      req.flash('success','Page has been updated')
    
    res.redirect 'back'

# DEL
exports.destroy = (req,res) ->