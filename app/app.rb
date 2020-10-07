# encoding: utf-8
require 'sinatra'
require 'json'
require 'yaml'
require 'csv'
require 'open-uri'

require_relative 'models/dice'
require_relative 'models/doah_deck'
require_relative 'models/bofh_gen'
require_relative 'models/hacker_says'
require_relative 'models/story_gen'

set :dice, Dice.new
set :deck, DevOpsAgainstHumanityDeck.new
set :bofh_gen, BastardOperatorsFromHellGen.new
set :hacker_says, HackerSays.new
set :story_gen, StoryGen.new

after do
  response['Access-Control-Allow-Origin']="*" unless settings.production?
end

require_relative 'routes/dice'
require_relative 'routes/doah'
require_relative 'routes/bofh_gen'
require_relative 'routes/hckr_says'
require_relative 'routes/story_gen'

#set :port, 9292 
set :environment, :production
set :run, false

