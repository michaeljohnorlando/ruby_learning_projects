require 'sinatra'
require 'sinatra/reloader'
#######################
# Sinatra (Web brick?)#
#######################
get '/' do
  shift  = params['shift'].to_i
  input  = params['input']
  output = eyncrypt(input,shift)
  erb :index,
  :locals => {
    :shift    => shift,
    :input    => input,
    :output   => output
  }
end
##############
# My Methods #
##############
def eyncrypt(input,shift)
  ##############################################
  # Check if input data validation and preping #
  ##############################################
  cipher_value = shift       # the cipher "KEY"
  return "Shift value cant be higher than 26" if cipher_value > 26
  data_in = input.downcase
  words = data_in.split
  #################################################
  # creates a multidementional array that has all #
  # the words charaters seperated for each word   #
  #################################################
  letters = []
  words.each do |word|
      letters << word.chars
  end
  ################################################
  # convert all charaters to numerric value      #
  # the adding is the cipher encription "action" #
  ################################################
  letter_to_number = []
  letters.each do |word|
      letter_to_number << " "
      word.each do |letter|
        # a = 97, z = 122
          if (letter.ord + cipher_value) > 122
            letter_to_number << 96 + ((letter.ord + cipher_value) - 122)
          else
            letter_to_number << letter.ord + cipher_value
          end
      end
  end
  ##############################################
  # converts back to letters, "encripted" then #
  # connects all the letters back to words     #
  ##############################################
  number_to_letter = []
  letter_to_number.each do |letter|
      number_to_letter << letter.chr
  end
  data_out = number_to_letter.join("")

  return data_out
  # .ord (will convert letter to number value)
  # .chr (convert number to letter value) 97 - 122 is the alphabet lowercase
  # .chars (converts to array of letters)
end
