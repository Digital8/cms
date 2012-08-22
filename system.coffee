###
 * System
 *
 * Core component to NodeFu.
 * The general go-to file to load in resources required
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

config = require './config'
mysql = require 'mysql'
fs = require 'fs'

exports.db = ( ->
  mysqlClient = mysql.createConnection(
    host     : config.database.host,
    user     : config.database.user,
    password : config.database.password,
    database : config.database.name 
  )
)()

exports.config = config

exports.db.prefix = config.database.prefix

# Give our loader some methods to load in specific resources
exports.load = 
  model: (model) ->
    require './models/' + model
  
  class: (className) ->
    require './lib/classes/' + className
	
  helper: (helper) ->
    require './lib/helpers/' + helper
  
  locale: (file) ->
    require "./locale/#{config.lang}/#{file}"