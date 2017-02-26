# encoding: UTF-8
# dice.rb

get '/lancia/:num_dice' do
  return_message = {}
  return_message[:status] = 'Ok'
  if params.has_key?('num_dice') then
    num_dice = (params['num_dice']).to_i
    return_message[:status] = 'Error - The number of dice is not valid!' if num_dice < 1
    return_message[:status] = 'Error - too much dice to throw!' if num_dice > 100
  end
  num_dice ||= 1
  if params.has_key?('faces') then
    faces = (params['faces']).to_i
    return_message[:status] = 'Error - The numer of faces is not valid!' if faces < 2
    return_message[:status] = 'Error - too much faces in a dice!' if faces > 65535
  end
  faces ||= 2

  if (return_message[:status] == 'Ok') then
    r = settings.dice.roll!(num_dice, faces)
    return_message[:dice] = num_dice
    return_message[:faces] = faces
    return_message[:throw] = r
    return_message[:value] = r.inject(:+)
  end
  return_message.to_json
end 
