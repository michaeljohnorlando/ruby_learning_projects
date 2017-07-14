require 'csv'
require 'sinatra'
require 'sinatra/reloader' if development?

class Hangman
  attr_accessor :wrong_guess,:word,:modified_word,:win,:info
  def initialize
    @wrong_guess   = []
    @word          = random_word_from_dictionary[0].downcase
    @modified_word = create_blank_word_display(@word)
    @win           = false
    @info          = false
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
  def letter_in_word(guess)
    @info = false
      if guess[/[a-z]+/]  != guess || guess.length != 1
        @info = true
        return "that is not a valid guess"
      elsif
        @word.include? guess
        return true
      else
        @wrong_guess << guess
        return  false
      end
  end
  def player_move(guess)
    counter = 0
    if letter_in_word(guess)
      @word.each_char do |letter,index|
        if letter == guess
          @modified_word[counter] = letter
        end
        counter += 1
      end
    end
    @win = true if @modified_word.join == @word
  end
end

#######################
# Sinatra (Web brick) #
#######################
game   = Hangman.new

get "/" do
  game   = Hangman.new if game.win
  game   = Hangman.new if game.wrong_guess.count > 5
  guess  = params['guess'].to_s
  game.player_move(guess) if defined? guess
  erb :index, :locals => {
    :word       => game.word,
    :guess      => guess,
    :status     => game.modified_word,
    :wrong_guess  => game.wrong_guess,
    :win_status   => game.win,
    :info         => game.info,
  }
end



#https://stackoverflow.com/questions/40600428/why-is-an-array-of-my-rails-objects-showing-up-when-using-remote-true/40600471#40600471
#http://www.integralist.co.uk/posts/sinatra.html
