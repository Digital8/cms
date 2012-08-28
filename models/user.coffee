###
 * User Model
 *
 * Handles all queries and actions to the database for the user
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

db = require('../system').db

exports.login = (credentials, callback) ->
  db.query "SELECT * FROM #{db.prefix}users WHERE user_alias = ? AND user_password = ?"
  , [credentials.username, credentials.password], callback
  
exports.getUserById = (user_id, callback) ->
  db.query "SELECT * FROM #{db.prefix}users WHERE user_id = ?", [user_id], callback
  
exports.getUserByAlias = (user_alias, callback) ->
  db.query "SELECT * FROM #{db.prefix}users WHERE user_alias = ?", [user_alias], callback

exports.findAll = (callback) ->
  db.query "SELECT * FROM #{db.prefix}users", callback