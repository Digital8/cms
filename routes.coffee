###
 * Routes
 *
 * Binds the website routes to specific actions in controllers
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
system = require './system'
fs = require 'fs'

# Load in the controllers
controllers = {}

fs.readdirSync("./controllers").forEach (module) -> 
  controllers[module.split('.')[0]] = require("./controllers/" + module)

# Load in the helpers
helpers =
  requireAuth: system.load.helper 'requireAuth'
  checkModule: system.load.helper 'checkModule'
  checkRights: system.load.helper 'checkRights'

module.exports = (app) ->
  # index
  app.get '/', controllers.index.index
  
  # Sign Up
  app.get '/sign-up', helpers.checkModule('register'), controllers.signup.index
  app.put '/sign-up', helpers.checkModule('register'), controllers.signup.create
  
  # Misc Routes
  app.get '/login', helpers.checkModule('login'), controllers.misc.login
  app.post '/login', helpers.checkModule('login'), controllers.misc.login
  
  app.get '/logout', controllers.misc.logout
  
  app.get '/administration/pages/:id/edit', helpers.checkModule('pages'), helpers.requireAuth, helpers.checkRights('CP'), controllers.admin_pages.edit
  app.put '/administration/pages/:id/edit', helpers.checkModule('pages'), helpers.requireAuth, helpers.checkRights('CP'), controllers.admin_pages.update
  
  # Custom pages
  app.all '*', controllers.page.view