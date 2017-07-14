require 'csv'

# forgot to make it a class again...

you_lose_display = "      _           _   _   _   \n /_/ / / / /  /  / / /_` /_` / \n /  /_/ /_/  /_,/_/ ._/ /_, .  \n"
you_win_display  = "     _                   \n/_/ / / / / | | | / /|/ /\n/  /_/ /_/  |/|/ / / | . \n"
the_board_display = [""," /~~\\ \n|o o |\n \\__/ \n"," /~~\\ \n|o o |\n \\__/ \n   |\n   |\n   |\n"," /~~\\ \n|o o |\n \\__/ \n __|\n   |\n   |",
" /~~\\ \n|o o |\n \\__/ \n __|__\n   |\n   |\n"," /~~\\ \n|o o |\n \\__/ \n __|__\n   |\n   |\n  /\n /\n",
" /~~\\ \n| o o|\n \\__/ Nooooo! \n __|__\n   |\n   |\n  / \\\n /   \\\n"]

def in_dictionary(word_checking)
    CSV.foreach("/home/ubuntu/workspace/hangman/data/dictionary.csv"){|word| return true if word.include? word_checking}
end
def word_input(human_or_AI) # human choses the word, needs to be >5 letters
    if human_or_AI == 'human'
        puts "Enter a word human"
        word_in = gets.chomp
        word_in = word_in.downcase
    else
        puts "AI picking a random word from the dictionary"
        word_in = random_word_from_dictionary.to_s  #gets the whole thing... ["Julien"]
        word_in.gsub!(/"|\[|\]/, '')                #removes the [,",]
        word_in = word_in.downcase
        # puts ".class (#{word_in.class}) // .length (#{word_in.length}) // .to_s.length - 4 (#{word_in.length - 4})" # info for cheking errors
    end

    if in_dictionary(word_in) == true && word_in.length > 4 && word_in.length < 12
        word_in
    elsif word_in.length <= 4
        puts "that word is too Easy!...(need 5 letters or more) Try again"
        word_input(human_or_AI)
    elsif word_in.length >= 12
        puts "that word is too Hard!...(need less then 11 letters) Try again"
        word_input(human_or_AI)
    else
        puts "that word is not in the dictonary!... Try again"
        word_input(human_or_AI)
    end
end
def random_word_from_dictionary # needs to be >5 letters
    CSV.read("/home/ubuntu/workspace/hangman/data/dictionary.csv").sample
end
def create_blank_word_display(word)
    underscore_array_for_ammount_of_letters = []
    word.length.times do
        underscore_array_for_ammount_of_letters << '_'
    end
    return underscore_array_for_ammount_of_letters
end
def letter_guess(guess)
    guess = guess.downcase
    guess
end
def letter_in_word(letter,word)
    #print "\nletter:#{letter} w:#{word}"
    if word.include? letter
        true
    else
        false
    end
end
def letter_position_in_word_display(letter,word,chosen_word)
    #print "\nletter:#{letter} w:#{word} cw:#{chosen_word}\n"
    if letter_in_word(letter,word) && letter.length == 1
        until letter_in_word(letter,word) == false
            @blank_word_display[word.index(letter)] = letter
            @modified_word[word.index(letter)]      = ' '
        end
    elsif letter == chosen_word
        @win =  true
    else
        @wrong_letter_choices << letter
        puts "incorrect guess"
    end
end
def save_game(chosen_word,y_or_n = gets.chomp)
    if ['y','Y','yes'].include? y_or_n
        puts "Save as?"
        save_name = gets.chomp
        Dir.mkdir("Saved_games") unless Dir.exists?("Saved_games")
        filename = "Saved_games/#{save_name}.csv"

        @wrong_letter_choices.each_with_index do |wrong_choice,index|
            if index == @wrong_letter_choices.count - 1
                File.open(filename,'a') {|file| file << "#{wrong_choice}\n"}
            else
                File.open(filename,'a') {|file| file << "#{wrong_choice},"}
            end
        end
        @blank_word_display.each_with_index do |right_choice,index|
            if index == @blank_word_display.count - 1
                File.open(filename,'a') {|file| file << "#{right_choice}\n"}
            else
                File.open(filename,'a') {|file| file << "#{right_choice},"}
            end
        end
        File.open(filename,'a') {|file| file << "#{chosen_word}\n"}
        File.open(filename,'a') {|file| file << "#{@modified_word}"}
    elsif ['n','N','no','NO','No',''].include? y_or_n
        puts "ok not saveing"
    else
        print "please put in yes or no... or just hit ENTER"
        save_game(chosen_word)
    end
end
def load_game
    @blank_word_display = []
    @wrong_letter_choices = []

    puts "what is the save file name?"
    save_file_name = gets.chomp
    save_file_name = "/home/ubuntu/workspace/hangman/lib/Saved_games/#{save_file_name}.csv"
    load_data = CSV.open save_file_name
    load_data.each_with_index do |row,index|
        @blank_word_display    << row
    end
    #@wrong_letter_choices = @blank_word_display[0]
    #@blank_word_display   = @blank_word_display[1]  # i sorta get it now looks terrible though
    #@blank_word_display.each {|make_arr|
    print "wrong_letter_choices:#{@blank_word_display[0]}\nblank_word_display:#{@blank_word_display[1]}\nchosen_word:#{@blank_word_display[2]}\nmodified_word:#{@blank_word_display[3]}"
    #print "blank word arr=#{@blank_word_display}\nwrong letter arr=#{@wrong_letter_choices} \n\n"
    @choice = 2
end
def start_screen
    puts "Welcome To Terminal Hangman \n\n"
    puts "1. start NEW GAME\n2. load saved game"
    start_selection = gets.chomp
    if start_selection.to_i == 1
        return
    else
        load_game
    end
end


start_screen
chosen_word           = (@choice == 2? @blank_word_display[2][0]: word_input('AI'))
@modified_word        = (@choice == 2? @blank_word_display[3][0]: chosen_word.dup)
@wrong_letter_choices = (@choice == 2? @blank_word_display[0]: [])
@blank_word_display   = (@choice == 2? @blank_word_display[1]: create_blank_word_display(chosen_word))

#@wrong_letter_choices.slice!(0..2)
puts chosen_word                           #for testing
until @lose == true || @win == true
    puts "\n"
    puts the_board_display[@wrong_letter_choices.count]
    puts "\n       the word so far                      wrong guesses"
    print "#{@blank_word_display}    #{@wrong_letter_choices} \n\n"

    puts "\n enter your guess:\n"
    letter_position_in_word_display(gets.chomp,@modified_word,chosen_word)

    @lose = true  if @wrong_letter_choices.count == 6
    @win  = true  if not(@blank_word_display.include?("_"))
    puts "would you like to save the game?  ((y =yes) (n or enter =no))" if not(@wrong_letter_choices.count == 6) || not(@win == true)
    save_game(chosen_word)
end

puts you_lose_display if @lose == true
puts you_win_display  if @win  == true
