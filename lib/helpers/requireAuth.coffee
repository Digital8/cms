###
 * Require Auth Helper
 *
 * Helper to restrict a page requiring authentication
 *
 * @package   Time for Advice
 * @author    Brendan Scarvell <bscarvell@gmail.com>
 * @copyright Copyright (c) 2012 - Current
 ###

module.exports = (req,res,next) ->
  if req.session.user_id
    next()
  else
    req.flash('notice','You must be logged in to do this')
    res.redirect '/login'