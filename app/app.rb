# encoding: utf-8
require 'sinatra'
require 'json'
require 'csv'
require 'open-uri'

require_relative 'models/dice'
require_relative 'models/doah_deck'
require_relative 'models/bofh_gen'

set :dice, Dice.new
set :deck, DevOpsAgainstHumanityDeck.new
set :bofh_gen, BastardOperatorsFromHellGen.new

after do
  response['Access-Control-Allow-Origin']="*" unless settings.production?
end

require_relative 'routes/dice'
require_relative 'routes/doah'

#set :port, 9292 
set :environment, :production
set :run, false

