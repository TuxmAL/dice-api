# dice_api.rb

require 'sinatra'
require 'json'
require_relative 'dice_model'

dice = Dice.new

###### Sinatra Part ###### 

#set :port, 8080 
#set :environment, :production 

get '/lancia/:num_dadi' do
  p params.inspect
  return_message = {}
  if params.has_key?('num_dadi') then
    num_dadi = (params['num_dadi']).to_i
    return return_message[:status] = 'Errore - Il numero di dadi non è valido!' if num_dadi < 1 
  end  
  num_dadi ||= 1  
  if params.has_key?('facce') then
    facce = (params['facce']).to_i
    return return_message[:status] = 'Errore - Il numero di facce non è valido!' if facce < 2 
  end
  facce ||= 2
  
  r = dice.roll!(num_dadi, facce)
  return_message[:status] = 'Ok' 
  return_message[:dadi] = num_dadi
  return_message[:facce] = facce
  return_message[:tiro] = r
  return_message[:valore] = r.inject(:+)
  return_message.to_json 
end 

post '/usa/:facce' do
  return_message = {} 
  facce = JSON.parse(params[:facce],:symbolize_names => true) 
  
end

post '/join' do 
  if jdata.has_key?(:name) && uno.join_game(jdata[:name]) 
    return_message[:status] = 'welcome' 
  else 
    return_message[:status] = 'sorry - game not accepting new players' 
  end 
  return_message.to_json 
end 
