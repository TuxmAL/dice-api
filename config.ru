# encoding: UTF-8

#set :port, 9292 
set :environment, :production
set :run, false

root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

run Sinatra::Application
