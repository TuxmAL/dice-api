# encoding: utf-8
# doah.rb

get '/genera' do
  return_message = {}
  return_message[:value] = @bofh_gen.generate
  return_message.to_json
end 
