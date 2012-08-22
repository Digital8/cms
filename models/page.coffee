
db = require('../system').db

exports.getPageByUrl = (url, callback) ->
  db.query "SELECT * FROM #{db.prefix}pages WHERE page_url = ?", [url], callback

exports.getNavigation = (callback) ->
  db.query "SELECT * FROM #{db.prefix}pages WHERE page_navigation_link = 1 AND page_enabled = 1", callback