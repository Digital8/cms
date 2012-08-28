###
 * Admin Model
 *
 * Handles all queries and actions to the database for the general site admin
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

db = require('../system').db

exports.getAdminPages = (rights, callback) ->
  db.query "SELECT * FROM #{db.prefix}admin WHERE admin_rights IN ('" + rights.join("','") + "')", callback

exports.getRootPages = (callback) ->
  db.query "SELECT * FROM #{db.prefix}admin", callback