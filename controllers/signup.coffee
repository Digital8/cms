###
 * Sign Up
 *
 * Controller to allow a user to sign-up to the website
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

formSchema = [
    label: 'Username'
    name: 'username'
    type: 'text' 
    value: ''
  ,
    label: 'Email'
    name: 'email'
    type: 'text'
    value: ''
  ,
    label: 'First Name'
    name: 'firstName'
    type: 'text'
    value: ''
  ,
    label: 'Last Name'
    name: 'lastName'
    type: 'text'
    value: ''
  ,
    label: 'Password'
    name: 'password'
    type: 'password'
    value: ''
  ,
    label: ''
    name: 'cmdSignUp'
    type: 'submit'
    value: 'Sign Up'
    class: 'btn btn-primary'
]

# GET
exports.index = (req,res) ->
  res.render 'sign-up/index', formSchema: formSchema
  
# GET
exports.view = (req,res) ->

# GET
exports.add = (req,res) ->

# PUT
exports.create = (req,res) ->
  req.flash('info','do the sign up process')
  res.redirect 'back'
  

# GET
exports.edit = (req,res) ->

# POST
exports.update = (req,res) ->

# DEL
exports.destroy = (req,res) ->