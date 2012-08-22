###
 * Misc Controller
 *
 * Controller for misc actions that aren't really RESTFUL
 *  - eg: Login, Logout
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
system = require '../system'

# Load helpers
helpers = 
  hash: system.load.helper 'hash'

# Load models
models = 
  user: system.load.model 'user'

exports.login = (req, res) ->
  locale = system.load.locale 'login'
  
  if req.body.username? and req.body.password?
    req.body.username ?= ''
    req.body.password ?= ''
    
    credentials = 
      username: req.body.username
      password: helpers.hash(req.body.password)
    
    models.user.login credentials, (err, results) ->
      if err then throw err
      if not results? or results.length == 0 
        req.flash('error','Incorrect Login')
        res.redirect '/login'
      else
        results = results.pop()
        req.session.user_id = results.user_id
        res.redirect '/'
  else
    res.render "login/index", locale: locale

exports.logout = (req, res) ->
  delete req.session.user_id
  res.redirect '/'