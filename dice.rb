# encoding: UTF-8
# dice.rb
root = ::File.dirname(__FILE__)
require ::File.join( root, 'app/app' )

Sinatra::Application.run!
