# a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) 
# as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original 
#string and how many times it was found.

def substrings(word,dictionary)
    @answer_part = []
    @answer      = []
    word = word.split
    dictionary.each do |dictionary_word| # this is a bit backward logic to search dictionary first for optimization << NOTE
        #puts "--------- #{dictionary_word} ----------"   # shows the start of each iteration of a dictionay word
        word.each  do |user_word|
            user_word = user_word.downcase
            if user_word.include? dictionary_word
            #puts "#{dictionary_word}"                    # shows the words found
            @answer_part << dictionary_word
            end
        end
    end
    @answer_part.each do |word_amount|                  # the rest just consolidates the answer and counts the copies to display the amount of it...
        unless @answer.include? ("(#{word_amount}, #{@answer_part.count word_amount})")  #unless is like !include?... but works
        @answer << "(#{word_amount}, #{@answer_part.count word_amount})"
        end
    end
    print @answer
    puts ""
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)