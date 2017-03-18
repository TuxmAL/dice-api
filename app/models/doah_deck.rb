# encoding: utf-8
# doah_deck.rb

class DevOpsAgainstHumanityDeck
# github master: 'https://raw.githubusercontent.com/bridgetkromhout/devops-against-humanity/master/cards-DevOpsAgainstHumanity.csv'

  def initialize(local_deck = true)
    #puts "Sinatra root #{Sinatra::Application::settings.root}."
    url = (local_deck)? ::File.join(Sinatra::Application::settings.root, '/resources/'): 'https://raw.githubusercontent.com/bridgetkromhout/devops-against-humanity/master/'
    url += 'cards-DevOpsAgainstHumanity.csv'
    #puts "Getting deck from #{url}."
    csv = CSV.new(open(url, "r:UTF-8"))
    @white=[]
    @black=[]
    csv.each do |row|
      @white << row[0] unless (row[0]).nil?
      @black << row[1] unless (row[1]).nil?
    end
  end

  def draw(discard = 0)
    raise RuntimeError, "You are allowed to discard zero to 10 card at least." if discard < 0 
    raise RuntimeError, "No more than 10 cards allowed to be discarded." if discard > 10 
    draw = ''
    (0..discard).each do
      draw =  (" #{@black.sample} ".gsub(/( +)?(\b|[^_])_+(\b|[^_])( +)?/) {" #{@white.sample.downcase} "}).strip.gsub(/\s+([.,!?;:])/, '\1')
    end
    return draw
  end
  
end
