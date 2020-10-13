# frozen_string_literal: true

# story_gen.rb

get '/racconta' do
  return_message = {}
  return_message[:value] = settings.story_gen.generate
  return_message.to_json
end

get '/tell' do
  return_message = {}
  return_message[:value] = settings.story_gen_en.generate
  return_message.to_json
end
