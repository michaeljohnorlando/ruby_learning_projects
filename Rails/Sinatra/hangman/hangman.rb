require 'csv'
require 'sinatra'
require 'sinatra/reloader' if development?

class Hangman
  attr_accessor :wrong_guess,:word
  def initialize
    @wrong_guess  = []
    @word         = random_word_from_dictionary[0]
  end
  def random_word_from_dictionary # needs to be > 5 letters
      CSV.read("./public/dictionary.csv").sample
  end
  def create_blank_word_display(word)
      underscore_array_for_ammount_of_letters = []
      word.length.times do
          underscore_array_for_ammount_of_letters << '_'
      end
      return underscore_array_for_ammount_of_letters
  end
  def letter_in_word(guess,word)
      if guess[/[a-z]+/]  != guess
        return "that is not a valid guess"
      elsif
        word.include? guess
        return true
      else
        @wrong_guess << guess
        return  false
      end
  end
  def letter_position_in_word_display(letter,word,chosen_word)
      if letter_in_word(letter,word) && letter.length == 1
          until letter_in_word(letter,word) == false
              @blank_word_display[word.index(letter)] = letter
              @modified_word[word.index(letter)]      = ' '
          end
      elsif letter == chosen_word
          @win =  true
      end
  end
end

#######################
# Sinatra (Web brick) #
#######################
game   = Hangman.new
status = game.create_blank_word_display(game.word)

get "/" do
  guess  = params['guess'].to_s
  game.letter_in_word(guess,game.word) if defined? guess
  erb :index, :locals => {
    :word       => game.word,
    :guess      => guess,
    :status     => status,
    :wrong_guess  => game.wrong_guess,
  }
end

letter_position_in_word_display(gets.chomp,@modified_word,chosen_word)

#https://stackoverflow.com/questions/40600428/why-is-an-array-of-my-rails-objects-showing-up-when-using-remote-true/40600471#40600471
#http://www.integralist.co.uk/posts/sinatra.html
