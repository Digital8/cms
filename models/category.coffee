###
 * Category Controller
 *
 * Model that handles all database queries for categories
 *
 * @package   Time for Advice
 * @author    Brendan Scarvell <bscarvell@gmail.com>
 * @copyright Copyright (c) 2012 - Current
 ###

db = require('../system').db

exports.getAllCategories = (callback) ->
  db.query "SELECT * FROM #{db.prefix}categories", callback
  
exports.getCategoryById = (category_id, callback) ->
  db.query "SELECT * FROM #{db.prefix}categories WHERE category_id = ?", [category_id], callback