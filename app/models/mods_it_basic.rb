# frozen_string_literal: true

module Modifiers
  def self.vocale?(c)
    %w[a e i o u à è é ì ò ù].member?(c.downcase)
  end

  def self.maschile?(s)
    c = s.downcase[-1]
    return true unless vocale?(c)
    case c
    when 'a', 'à'
      false
    else
      true
    end
  end

  def self.plurale(s)
    case (s[-1])
    when 'a'
      s[0...-1] + 'e'
    when 'o', 'e'
      s[0...-1] + 'i'
    when 'i'
      s
    when 'u'
      s
    when 'à', 'è', 'é', 'ì', 'ò', 'ù'
      s
    when 'é'
      s[0...-1] + 'i'
    when 'e'
      s[0...-1] + 'i'
    when 'e'
      s[0...-1] + 'i'
    end
  end

  def self.maiuscolo(s)
    head = s[0]
    remainder = s[1..-1]
    return s if head.nil?

    head.upcase!
    return head if remainder.nil?

    head + remainder
  end

  def self.strizza_spazi(s)
    s.squeeze(' ').strip
  end
  
  def self.baseItModifiers
    {
      'replace' => lambda do |s, parameters|
        return s.gsub(/#{Regexp.quote(parameters[0])}/, parameters[1])
      end,

      'strizza' => lambda do |s, _parameters|
        return strizza_spazi s
      end,

      'maius_tutto' => lambda do |s, _parameters|
        return s.gsub(/\w+/) { |word| maiuscolo word }
      end,

      'maius' => lambda do |s, _parameters|
        return maiuscolo s
      end,

      'un' => lambda do |s, _parameters|
        unless s.empty?
          unless maschile?(s)
            if vocale?(s[0])
              return "un'#{s}" 
            else
              return "una #{s}" 
            end
          end
          else
            return "uno #{s}" if 'ijxyz'.include?(s[0])
            # gn di gnomo, ps, pn, s seguita da consonante, sci-, sce-
            return "uno #{s}" if %w[gn ps pn].include? s[0..-1] || (s.size > 1 && s[0] == 's' && ! vocale?(s[1]))
        end
        return "un #{s}"
      end,

      'firstS' => lambda do |s, _parameters|
        words = s.split(' ')
        words[0] = plurale words[0] unless words.empty?
        return words.join ' '
      end,

      'plur' => lambda do |s, _parameters|
        return plurale(s)
      end,

      'ed' => lambda do |s, _parameters|
        case (s[-1])
        when 's', 'h', 'x'
          s + 'ed'
        when 'e'
          s + 'd'
        when 'y'
          return s[0...-1] + 'ied' unless vocale?(s[-2])
          s + 'd'
        else
          return s + 'ed'
        end
      end
    }
  end
end
