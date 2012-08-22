
module.exports = 
  (right) ->
    (req,res,next) ->
      if res.locals.objUser.checkRights(right)
        next()
      else
        res.redirect '/'