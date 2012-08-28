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
	  @action = if pageData.page_action is 0 then '' else pageData.page_action
	  @controller = if pageData.page_controller is 0 then '' else pageData.page_controller.split('.')[0]
	  @method = if pageData.page_controller is 0 then '' else pageData.page_controller.split('.')[1]
	  @title = pageData.page_title
	  @header = pageData.page_header
	  @content = pageData.page_content
	  @restricted = pageData.page_require_auth
	  @enabled = pageData.page_enabled
	  @htmlEnabled = pageData.page_enable_html
	  @commentsEnabled = pageData.page_enable_comments