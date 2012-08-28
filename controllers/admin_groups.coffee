###
 * Skeleton Controller
 *
 * Controller Template For Plugin
 *
 * @package   Digital8 CMS
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###

system = require '../system'

helpers = {}

models = 
  groups: system.load.model 'group'

exports.index = (req,res) ->
  models.groups.findAll (err, groups) ->
    if err then throw err
    res.render 'administration/groups/index', groups: groups
  
exports.view = (req,res) ->

exports.add = (req,res) ->

exports.create = (req,res) ->

exports.edit = (req,res) ->

exports.update = (req,res) ->

exports.destroy = (req,res) ->