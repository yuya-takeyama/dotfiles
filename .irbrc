require 'rubygems'
require 'pp'
require 'irb/completion'
require 'wirble'

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 200

Wirble.init
Wirble.colorize
