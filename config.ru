# encoding: UTF-8

root = ::File.dirname(__FILE__)
require ::File.join( root, 'app/app' )

run Sinatra::Application
