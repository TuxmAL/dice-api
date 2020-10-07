# frozen_string_literal: true
# encoding: utf-8
# story_gen.rb

get '/racconta' do
  return_message = {}
  return_message[:value] = settings.story_gen.generate
  return_message.to_json
end
