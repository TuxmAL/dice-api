# encoding: utf-8
# bofh_gen.rb

get '/genera' do
  return_message = {}
  return_message[:value] = settings.bofh_gen.generate
  return_message.to_json
end 
