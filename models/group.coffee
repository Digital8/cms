###
 * Groups Model
 *
 * Handles all queries and actions to the database for the user groups
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

db = require('../system').db

exports.findAll = (callback) ->
  db.query "SELECT * FROM #{db.prefix}groups", callback