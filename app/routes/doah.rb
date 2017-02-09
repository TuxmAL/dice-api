# encoding: UTF-8
# doah.rb

get '/pesca' do
  return_message = {}
  return_message[:status] = 'Ok'
  if params.has_key?('discard') then
    scartando = (params['discard']).to_i
    return_message[:status] = 'Error - You are allowed to discard zero to 10 card at least.' if scartando < 1
    return_message[:status] = 'Error - No more than 10 cards are allowed to discard.' if scartando > 10
  end
  scartando ||= 0

  if (return_message[:status] == 'Ok') then
    r = @deck.draw(scartando)
    return_message[:discarded] = scartando
    return_message[:value] = r
  end
  return_message.to_json
end 
