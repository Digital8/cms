###
 * Server
 *
 * Application Server
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
express = require 'express'
expressValidator = require 'express-validator'
flashify = require 'flashify'

# Include system core
system = require './system'

  
# Load some helpers
helpers = {}

# Load global models
models =
  user: system.load.model 'user'
  page: system.load.model 'page'

classes = 
  user: system.load.class 'user'
  page: system.load.class 'page'

app = express()

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use expressValidator
  app.use express.cookieParser('secretsecret')
  app.use express.session()
  app.use flashify
  
  app.use (req,res,done) ->
    system.config.globals.locale = system.load.locale('global')
    res.locals.session  = req.session
    res.locals.globals = system.config.globals
    res.locals.modules = system.config.modules ? {} # If modules exist, allow views to check its status
    res.locals.objUser = new classes.user [] # Empty user object
    
    models.page.getNavigation (err, pageResults) ->
      if err then throw err
      pages = []
      i=0
      
      # Create a page object of each page
      for [0...pageResults.length]
        pages[i] = new classes.page pageResults[i]
        i++  
        
      res.locals.pages = pages or {}
      
      if req.session.user_id?
        
        models.user.getUserById req.session.user_id, (err, results) ->
          if err then throw err
          if results.length > 0
            res.locals.objUser = new classes.user results.pop()
            done()
      else
        done()

  app.use express.static "#{__dirname}/public"
  app.use app.router
  
server = app.listen system.config.port


# Application routes
require('./routes')(app)

console.log "Server started on port #{system.config.port}"

