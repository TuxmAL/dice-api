# encoding: utf-8
# hacker_says.rb
# Get quotes (ten at times) from http://hackersays.com/quotes every 5 quotes acknowledges are made to site authors.

class HackerSays
  ACK_EVERY_NUM_QUOTES = 5
  ACK_EVERY_NUM_QUOTES.freeze

  def initialize()
    @acknowledgement = ACK_EVERY_NUM_QUOTES
    @quotes = get_quotes()
  end

  def quotes
    puts @quotes.inspect
     @quotes = get_quotes() if @quotes.empty?
    return @quotes
  end

  def quote()
    q = quotes.pop
    q += "\nQuotes are from http://hackersays.com/\n-- Thanks to Jarmo Pertman (@jarm0) and Andri Möll (@theml)" if @acknowledgement == ACK_EVERY_NUM_QUOTES
    @acknowledgement -= 1
    @acknowledgement = ACK_EVERY_NUM_QUOTES if @acknowledgement < 0
    return q
  end

private

  def get_quotes()
    quotes = []
    begin
      yaml_content = open('http://hackersays.com/quotes') { |f| f.read }
      yaml_quotes = YAML::load(yaml_content)
      yaml_quotes.each do |quote|
        quotes << "#{quote['c']}\n-- #{quote['a'] || "Anonymous"}"
      end
    rescue
      quotes = ['']
    end
    return quotes
  end

end
