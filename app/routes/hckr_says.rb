# encoding: utf-8
# hckr.rb

get '/cita' do
  return_message = {}
  return_message[:status] = 'Ok'
  quote = settings.hacker_says.quote
  return_message[:status] = 'Error - can\'t get quotes from http://hackersays.com/' if quote.empty?
  return_message[:value] = quote
  return_message.to_json
end 
