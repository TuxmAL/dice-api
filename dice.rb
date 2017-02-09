# encoding: UTF-8
# dice.rb
root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

Sinatra::Application.run!
