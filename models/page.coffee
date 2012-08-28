
db = require('../system').db

exports.getPageByUrl = (url, callback) ->
  db.query "SELECT * FROM #{db.prefix}pages WHERE page_url = ? AND page_enabled = 1 AND page_action = 0 AND page_controller = 0", [url], callback

exports.getPageById = (id, callback) ->
  db.query "SELECT * FROM #{db.prefix}pages WHERE page_id = ?", [id], callback

exports.getNavigation = (callback) ->
  db.query "SELECT * FROM #{db.prefix}pages WHERE page_navigation_link = 1 AND page_enabled = 1 ORDER BY page_order", callback

exports.getAllPages = (callback) ->
  db.query "SELECT * FROM #{db.prefix}pages ORDER BY page_order", callback

exports.update = (fields, callback) ->
  db.query "UPDATE #{db.prefix}pages SET page_url = ?, page_title = ?, page_enabled = ?, page_content = ? WHERE page_id = ?", [fields.url,fields.title,fields.online,fields.content,fields.id], callback

exports.getRoutes = (callback) ->
  db.query "SELECT page_url, page_action, page_controller FROM #{db.prefix}pages WHERE NOT(page_action = '0' AND page_controller = '0') AND page_enabled = 1", callback