###
 * Hash Helper
 *
 * Helper to quickly generate and return a hash
 *
 * @package   Time for Advice
 * @author    Brendan Scarvell <bscarvell@gmail.com>
 * @copyright Copyright (c) 2012 - Current
 ###
 
crypto = require 'crypto'

module.exports = (msg) ->
  crypto.createHmac('sha256', 'TimeForAdviceSalt').update(msg).digest('hex')