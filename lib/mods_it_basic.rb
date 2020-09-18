# frozen_string_literal: true

module Modifiers
  def self.vowel?(c)
    %w[a e i o u à è é ì ò ù].member?(c.downcase)
  end

  def self.pluralize(s)
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

    when 'y'
      if !isVowel(s[-2])
        s[0...-1] + 'ies'
      else
        s + 's'
      end
    else
      s + 's'
    end
  end

  def self.capitalize(s)
    head = s[0]
    remainder = s[1..-1]
    return s if head.nil?

    head.upcase!
    return head if remainder.nil?

    head + remainder
  end

  def self.baseItModifiers
    {
      'replace' => lambda do |s, parameters|
        return s.gsub(/#{Regexp.quote(parameters[0])}/, parameters[1])
      end,

      'capitalizeAll' => lambda do |s, _parameters|
        return s.gsub(/\w+/) { |word| capitalize word }
      end,

      'capitalize' => lambda do |s, _parameters|
        return capitalize s
      end,

      'a' => lambda do |s, _parameters|
        unless s.empty?
          if s =~ /^u((\wi)|(\W))/
            # catches "university" and "u-boat"
            return "a #{s}"
          end

          return "an #{s}" if isVowel(s[0])
        end

        return "a #{s}"
      end,

      'firstS' => lambda do |s, _parameters|
        words = s.split(' ')
        words[0] = pluralize words[0] unless words.empty?
        return words.join ' '
      end,

      's' => lambda do |s, _parameters|
        return pluralize(s)
      end,

      'ed' => lambda do |s, _parameters|
        case (s[-1])
        when 's', 'h', 'x'
          s + 'ed'
        when 'e'
          s + 'd'
        when 'y'
          return s[0...-1] + 'ied' unless vowel?(s[-2])
          s + 'd'
        else
          return s + 'ed'
        end
      end
    }
  end
end
