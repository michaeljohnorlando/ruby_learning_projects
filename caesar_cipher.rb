puts "enter text to be converted to caesar's cipher"
data_in = gets.chomp         # gets user input
data_in = data_in.downcase   # only allows lowercase // no confusion when numeric value happens

words = data_in.split        # seperates the words (wherever there is a space) 

letters = [] 
words.each do |word|
    letters << word.chars  # creates a multidementional array that has all the words 
end                        # charaters seperated for each word


cipher_value = 3           # the cipher "KEY" // gets.chomp if user wants to set it...
letter_to_number = []      # converts all charaters to numerric value
letters.each do |word|     # the subtracting is the cipher encription "action"
    letter_to_number << " "
    word.each do |letter|  
        if (letter.ord - cipher_value) > 96 && (letter.ord - cipher_value) < 123 
            letter_to_number << letter.ord - cipher_value
        elsif (letter.ord - cipher_value) <= 96
            letter_to_number << 122 - (96-(letter.ord - cipher_value))
        elsif (letter.ord - cipher_value) > 122 # this should not happen...
            letter_to_number << ((letter.ord - cipher_value)-122)
            print "error = above 122 ???"
        end
    end
end

number_to_letter = []                   # converts back to letters// "encripted"
letter_to_number.each do |letter|
    number_to_letter << letter.chr
end
data_out = number_to_letter.join("")    # connects all the letters 

puts data_out # shows the final answer

                  # .ord (will convert letter to number value)
                  # .chr (convert number to letter value) 97 - 122 is the alphabet
                  #.chars (converts to array of letters)