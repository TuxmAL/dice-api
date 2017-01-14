# dice_api.rb

require 'sinatra'
require 'json'
require_relative 'dice_model'

dice = Dice.new

###### Sinatra Part ###### 

#set :port, 8080 
#set :environment, :production

after do
    response['Access-Control-Allow-Origin']="*" unless settings.production?
end

get '/lancia/:num_dice' do
  return_message = {}
  return_message[:status] = 'Ok' 
  if params.has_key?('num_dice') then
    num_dice = (params['num_dice']).to_i
    return_message[:status] = 'Error - The number of dice is not valid!' if num_dice < 1 
  end  
  num_dice ||= 1  
  if params.has_key?('faces') then
    faces = (params['faces']).to_i
    return_message[:status] = 'Error - The numer of faces is not valid!' if faces < 2 
  end
  faces ||= 2
  
  if (return_message[:status] == 'Ok') then
    r = dice.roll!(num_dice, faces)
    return_message[:dice] = num_dice
    return_message[:faces] = faces
    return_message[:throw] = r
    return_message[:value] = r.inject(:+)
  end
  return_message.to_json
end 

post '/usa/:faces' do
  return_message = {} 
  faces = JSON.parse(params[:faces],:symbolize_names => true) 
  
end

post '/join' do 
  if jdata.has_key?(:name) && uno.join_game(jdata[:name]) 
    return_message[:status] = 'welcome' 
  else 
    return_message[:status] = 'sorry - game not accepting new players' 
  end 
  return_message.to_json 
end 
