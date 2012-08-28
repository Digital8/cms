###
 * checkGroups helper
 *
 * Helper to check if a user group has permission to a page
 *
 * @package   Digital8
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
module.exports = 
  (groups, objUser) ->
    if not groups.length then return true
    
    for group in groups
      if objUser.checkGroup(group) is true
        return true
    
    return false