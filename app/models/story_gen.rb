# frozen_string_literal: true

# story_gen.rb
require 'tracery'

require_relative 'mods_it_basic'
# require 'mods-eng-basic'
class StoryGen
  include Tracery

  def initialize
    story = {
      'nome': ['Linus Torvalds', 'Matz Yukihiro Matsumoto', 'Anders Hejlsberg', 'Dennis Ritchie',
               'Steve Wozniak', 'Guido van Rossum', 'James Gosling', 'Bjärne Stroustrup',
               'John McCarthy', 'Brendan Eich', 'Alan Kay', 'Alain Colmerauer'],
      'prodotto': ['Linux', 'Java', 'Ruby', 'C#', 'Python', 'C++', 'C', 'AppleDOS',
                   'Lisp', 'Javascript', 'Smalltalk', 'Prolog'],
      'umore': %w[indispettito indignato appassionato malinconico astuto cortese paranoico accalorato glaciale
                  distaccato imperturbabile agghiacciato entusiasta],
      'motivation': ['semplice', 'complicato', 'incasinato', 'inusabile', 'teorico', 'di basso livello', 'generico',
                     'duttile', 'difficile', 'illegibile', 'imperativo', 'orientato ai messaggi'],
      'avversativa': %w[ma tuttavia sebbebe nonostante eppure invece nondimeno],
      'aspettativa': %w[contento felice arrabbiato critico deluso sorpreso disinteressato indifferente sbalordito
                        meravigliato],
      'storia': ['#eroe#, #umore#, creò #prod#, perché #prodotto# era troppo #motivation#. #avversativa# #nome# non ne fu #aspettativa#.'],
      'origine': ['#[eroe:#nome#][prod:#prodotto#]storia#']
    }
    @grammar = createGrammar(story)
    @grammar.addModifiers(Modifiers.baseItModifiers);
    @grammar.clearState
  end

  def generate
    @grammar.flatten('#origine#')
    # all_errors = root.allErrors
    # root.finishedText
  end
end
