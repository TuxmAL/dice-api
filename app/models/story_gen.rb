# frozen_string_literal: true

# story_gen.rb
require 'tracery'

require_relative 'mods_it_basic'
require 'mods-eng-basic'

class StoryGen
  include Tracery

  def initialize(lang)
    names = ['John Backus', 'Matz Yukihiro Matsumoto', 'Anders Hejlsberg', 'Dennis Ritchie',
             'John George Kemeny', 'Guido van Rossum', 'James Gosling', 'Bjärne Stroustrup',
             'John McCarthy', 'Brendan Eich', 'Alan Kay', 'Alain Colmerauer']
    languages = ['Fortran', 'Java', 'Ruby', 'C#', 'Python', 'C++', 'C', 'Basic',
                 'Lisp', 'Javascript', 'Smalltalk', 'Prolog']
    products = %w[Lotus123 Visicalc Wordstar Tetris Breakout Galaga Apache OpenSSL Tomcat
                  OpenOffice Gimp Netscape Vim Edlin Emacs Textedit]
    hardwares = ['Arduino', 'Raspberry PI', 'XBox', 'Playstation', 'Wii', 'Switch', 'Android', 'ZX Spectrum',
                 'Commodore 64', 'jail-broken iPhone', 'MacBook', 'Core i7 PC', 'Ryzen 7 PC']

    storia = {
      'nome': names,
      'linguaggio': languages,
      'umore': %w[indispettito indignato appassionato malinconico astuto cortese paranoico accalorato glaciale
                  distaccato imperturbabile agghiacciato entusiasta],
      'qualita': %w[appassionato astuto paranoico distaccato imperturbabile entusiasta eccentrico normale professionale
                    incompetente dilettante],
      'motivation': ['semplice', 'complicato', 'incasinato', 'inusabile', 'teorico', 'di basso livello', 'generico',
                     'duttile', 'difficile', 'illegibile', 'imperativo', 'orientato ai messaggi'],
      'modalita': ['complicato', 'incasinato', 'semplice', 'complesso', 'comodo', 'scomodo', 'facile', 'difficile',
                   'agevole', 'disagevole', 'da #tipo#', 'come #comparativo#'],
      'tipo': %w[geek nerd n00b esperti lamer professionista acker],
      'comparativo': %w[volare viaggiare drogarsi giocare studiare lavorare disegnare scrivere dipingere cucinare],
      'avversativa': ['ma', 'tuttavia', 'eppure', 'invece', 'nondimeno', 'però', 'mentre', 'anzi',
                      'd\'altra parte', 'd\'altro canto', 'comunque'],
      'avversativa_cond': %w[nonostante sebbene],
      'forse_nega': ['', 'non'],
      'forse_tutti': ['#forse_nega# tutti'],
      'aspettativa': %w[contento felice arrabbiato critico deluso sorpreso disinteressato indifferente sbalordito
                        meravigliato],
      'prodotto': products,
      'hardware': hardwares,
      'storia': [
        '#eroe#, #umore#, creò #ling# perché #linguaggio# era troppo #motivation#. #avversativa.maius# #nome# #forse_nega# ne fu #aspettativa#.',
        '#eroe# e #nome#, #umore.plur#, adottarono #ling# per scrivere #prodotto#. #aspettativa.un.maius# #nome# ne fu #umore#.',
        '#forse_tutti.strizza.maius# sanno che #nome# riscrisse #prodotto# in #ling#, peccato non poter trovare i sorgenti facilmente!',
        'Si dice che riscrivere #ling# in #ling# #forse_nega# fosse lo scopo ultimo di un #umore# #nome#.',
        'Lavorare su #hardware# con #ling# è #modalita#, ma si sa, io sono #qualita#.'
      ],
      'origin': ['#[eroe:#nome#][ling:#linguaggio#]storia.strizza#']
    }

    story = {
      'name': names,
      'language': languages,
      'mood': %w[vexed indignant passionate sad clever polite paranoic fervent icy
                 aloof stolid chilled mad],
      'attribute': %w[passionate clever paranoid aloof imperturbable enthusiastic eccentric normal professional
                      unqualified amateur],
      'motivation': ['simple', 'complex', 'messed up', 'unusable', 'theoretic', 'low level', 'general',
                     'ductile', 'hard', 'unreadable', 'imperative', 'message oriented'],
      'mode': ['complex', 'messed up', 'simple', 'tricky', 'handy', 'awkward', 'easy', 'hard',
               'manageable', 'uncomfortable', 'geeky', 'nerdy', 'for n00b', 'lame', 'hackish', 'for professional',
               'like #comparative#'],
      'comparative': %w[flying traveling tripping playing studying working drawing writing painting cooking],
      'adversative': %w[but however though instead nonetheless yet while rather again anyway],
      'adversative_cond': %w[nevertheless although],
      'may_negate': ['', 'n\'t'],
      'maybe_all': ['not everyone', 'everyone'],
      'expectation': %w[glad happy angry crucial disappointed astonished selfless impassible amazed
                        thunderstruck],
      'product': products,
      'hardware': hardwares,
      'story': [
        '#hero#, #mood#, created #lang# because #language# was too #motivation#. #adversative.capitalize# #name# was#may_negate# #expectation# about it.',
        '#hero# and #name#, #mood.s#, adopted #lang# for writing #product#. #expectation.a.capitalize# #name# was #mood# with it.',
        '#maybe_all.capitalize# knows that #name# rewrote #product# in #lang#, it\'s such a shame not to be able to easily find the source code!',
        'It is said that rewiting #lang# in #lang# was#may_negate# the ultimate goal of a #mood# #name#.',
        'Working on #hardware# with #lang# is #mode# but, you know, I\'m #attribute#.'
      ],
      'origin': ['#[hero:#name#][lang:#language#]story#']
    }

    if lang.downcase == 'it'
      @grammar = createGrammar(storia)
      @grammar.addModifiers(Modifiers.baseItModifiers)
    else
      @grammar = createGrammar(story)
      @grammar.addModifiers(Modifiers.baseEngModifiers)
    end
    @grammar.clearState
  end

  def generate
    @grammar.flatten('#origin#')
    # all_errors = root.allErrors
    # root.finishedText
  end
end
