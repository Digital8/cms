###
 * User class
 *
 * Creates an object of the users credentials
 *
 * @package		Time for Advice
 * @author    Brendan Scarvell <bscarvell@gmail.com>
 * @copyright Copyright (c) 2012 - Current
 ###

accountLevel =
  banned : 102
  member : 103
  admin  : 104
  root   : 105

module.exports = class User
	constructor: (userData) ->
	  userData.user_rights ?= ''
	  @id = userData.user_id or 0
	  @alias = userData.user_alias or 'Guest'
	  @firstName = userData.user_first_name or ''
	  @lastName = userData.user_last_name or ''
	  @displayName = "#{@firstName} #{@lastName}" or ''
	  @email = userData.user_email or ''
	  @level = userData.user_level or 0
	  @userRights = userData.user_rights.split '.'
	
	isMember: ->
	  return (@level >= accountLevel.member) ? true : false
	
	isAdmin: ->
	  return (@level >= accountLevel.admin) ? true : false
	  
	isRoot: ->
	  return (@level == accountLevel.root) ? true : false

	isBanned: ->
	   return (@level == accountLevel.banned) ? true : false
	   
	isOwner: (owner_id) ->
	  
	  if @id == owner_id
	    return true
	  else if @isRoot() or @isAdmin()
	    return true
	  else 
	    return false
	    
	isAuthed: ->
	  if @id is 0 then return false else return true
	  
	checkRights: (right) ->
	   if @isRoot() 
  	    return true
  	  else
  	    if not right?
          return @userRights.length
  	    else
    	    authorized = false
    	    for priv in @userRights
    	      if priv == right
    	        authorized = true
    	        break

  	    return authorized