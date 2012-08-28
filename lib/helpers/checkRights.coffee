###
 * checkRights helper
 *
 * Helper to check if a user has specific rights
 *
 * @package   Digital8
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

module.exports = 
  (right) ->
    (req,res,next) ->
      if res.locals.objUser.checkRights(right)
        next()
      else
        res.redirect '/'