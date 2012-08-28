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

models = 
  pages: system.load.model 'page'

module.exports = (app) ->
  
  # Get all routes out of the database and bind the,
  models.pages.getRoutes (err, routes) ->
    # Throw error if exists. No point continuing if we cant get routes working!
    if err then throw err
    for route in routes
      switch route.page_action.toLowerCase()
        when 'get' then app.get route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
        when 'post' then app.post route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
        when 'put' then app.put route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
        when 'del' then app.del route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
        when 'delete' then app.del route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
        else app.get route.page_url, controllers[route.page_controller.split('.')[0]][route.page_controller.split('.')[1]]
      
    # Then bind rest of the current views
    app.all '*', controllers.page.view