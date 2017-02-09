# encoding: utf-8
require 'sinatra'
require 'json'
require 'csv'
require 'open-uri'

require_relative 'models/dice'
require_relative 'models/doah_deck'

after do
  response['Access-Control-Allow-Origin']="*" unless settings.production?
end

before '/lancia/:num_dice' do
  @dice = Dice.new
end

before '/pesca' do
  @deck = DevOpsAgainstHumanityDeck.new
end

require_relative 'routes/dice'
require_relative 'routes/doah'

#set :port, 9292 
set :environment, :production
set :run, false

