###
 * Page class
 *
 * Stores credentials for custom pages
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

module.exports = class Page
	constructor: (pageData) ->
	  @id = pageData.page_id
	  @url = pageData.page_url
	  @header = pageData.page_header
	  @content = pageData.page_content
	  @restricted = pageData.page_require_auth