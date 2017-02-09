# encoding: utf-8
require 'sinatra'
require 'json'
require 'csv'
require 'open-uri'

require_relative 'models/dice'
require_relative 'models/doah'

require_relative 'routes/dice'
require_relative 'routes/doah'
#set :port, 9292 
set :environment, :production
set :run, false

dice = Dice.new
deck = DevOpsAgainstHumanityDeck.new
