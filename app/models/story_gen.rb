# frozen_string_literal: true

# story_gen.rb
require 'tracery'

require_relative 'mods_it_basic'
# require 'mods-eng-basic'
class StoryGen
  include Tracery

  def initialize
    story = {
      'nome': ['John Backus', 'Matz Yukihiro Matsumoto', 'Anders Hejlsberg', 'Dennis Ritchie',
               'John George Kemeny', 'Guido van Rossum', 'James Gosling', 'Bjärne Stroustrup',
               'John McCarthy', 'Brendan Eich', 'Alan Kay', 'Alain Colmerauer'],
      'linguaggio': ['Fortran', 'Java', 'Ruby', 'C#', 'Python', 'C++', 'C', 'Basic',
                   'Lisp', 'Javascript', 'Smalltalk', 'Prolog'],
      'umore': %w[indispettito indignato appassionato malinconico astuto cortese paranoico accalorato glaciale
                  distaccato imperturbabile agghiacciato entusiasta],
      'motivation': ['semplice', 'complicato', 'incasinato', 'inusabile', 'teorico', 'di basso livello', 'generico',
                     'duttile', 'difficile', 'illegibile', 'imperativo', 'orientato ai messaggi'],
      'avversativa': ['ma', 'tuttavia', 'eppure', 'invece', 'nondimeno', 'però', 'mentre', 'anzi',
                      'd\'altra parte', 'd\'altro canto', 'comunque'],
      'avversativa_cond': %w[nonostante, sebbene],
      'forse_nega': ['', 'non'],
      'forse_tutti': ['#forse_nega# tutti'],
      'aspettativa': %w[contento felice arrabbiato critico deluso sorpreso disinteressato indifferente sbalordito
                        meravigliato],
      'prodotto': %w[Lotus123 Visicalc Wordstar Tetris Breakout Galaga Apache OpenSSL Tomcat OpenOffice Gimp Netscape Vim Edlin Emacs Textedit],
      'storia': [
                 '#eroe#, #umore#, creò #ling# perché #linguaggio# era troppo #motivation#. #avversativa.maius# #nome# #forse_nega# ne fu #aspettativa#.',
                 '#eroe# e #nome#, #umore.plur#, adottarono #linguaggio# per scrivere #prodotto#. #aspettativa.un.maius# #nome# ne fu #umore#.',
                 '#forse_tutti.strizza.maius# sanno che #nome# riscrisse #prodotto# in #linguaggio#, peccato non poter trovare i sorgenti facilmente!',
                 'Si dice che riscrivere #ling# in #ling# #forse_nega# fosse lo scopo ultimo di un #umore# #nome#.'
                ],
      'origine': ['#[eroe:#nome#][ling:#linguaggio#]storia.strizza#']
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
