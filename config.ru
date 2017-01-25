# encoding: UTF-8
require './app/dice_api'

#set :port, 9292 
set :environment, :production
set :run, false

run Sinatra::Application
