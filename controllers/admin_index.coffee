###
 * Administration Index
 *
 * Displays the admin panel tools according to what permissions are set for the user
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

system = require '../system'

# Load in database models
models = 
  admin: system.load.model 'admin'

# GET
exports.index = (req,res) ->
  if (res.locals.objUser.isRoot())
    models.admin.getRootPages (err, admin_pages) ->
      if err then throw err
      res.render 'administration/index', admin_pages: admin_pages
  else
    models.admin.getAdminPages res.locals.objUser.userRights, (err, admin_pages) ->
      if err then throw err
      res.render 'administration/index', admin_pages: admin_pages
  
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