###
 * Configuration
 *
 * Application Settings
 *
 * @package   Digital8 <http://digital8.com.au>
 * @author    Brendan Scarvell <brendan@digital8.com.au>
 * @copyright Copyright (c) 2012 - Current
 ###
 
module.exports =
  globals:
    site:
      name: 'Super awthum CMS name'
    href:
      admin   : '/administration/'
      images  : '/images/'

  database:
    type    : 'mysql'
    host    : 'localhost'
    user    : 'root'
    password: ''
    name    : 'nodefu'
    prefix  : 'nodefu_'
  
  modules:
    login     : true
    register  : true
    profile   : true
    pages     : true
  
  lang: 'en'
    
  port: 3000