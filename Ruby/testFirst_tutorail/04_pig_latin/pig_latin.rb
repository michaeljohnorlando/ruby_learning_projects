def translate input
    numberOfVowels     = 0
    numberOfConsonants = 0
    vowels             = ['a','e','i','o','u']
    saveLetters        = []
    words              = input.split(' ')
    answer             = []

    words.each do |word|
        #needed to reset,def for each thing would be better
        numberOfConsonants = 0
        
    if vowels.include? word[0]
        word.each_char do |char|
            if vowels.include? char
                numberOfVowels += 1
            else
                answer << word + 'ay'
            end
        end
        
    elsif word.include? 'qu'
        exceptions = word.split('qu')
        answer << exceptions[1] + exceptions[0] + 'quay'
    else 
        word.each_char do |char|
            if vowels.any? {|vowel|  char == vowel}
                break
            else
                numberOfConsonants += 1
            end
        end
        number = 0
        
        until number == numberOfConsonants
            saveLetters[number] = word[0]
            word[0]       = ''
            number += 1
        end
        # these should be done in one method...
        if numberOfConsonants === 1
            answer << (word + saveLetters[0] + 'ay')
        elsif numberOfConsonants === 2
            answer << (word + saveLetters[0] + saveLetters[1] + 'ay')
        elsif numberOfConsonants === 3
            answer << (word + saveLetters[0] + saveLetters[1] + saveLetters[2] + 'ay')
        end
    end
    end
    
        if words.length == 1
            return answer[0]
        elsif words.length == 2
            return answer[0] + " " + answer[1]
        elsif words.length == 3
            return answer[0] + " " + answer[1] + " " + answer[2]
        elsif words.length == 4
            return answer[0] + " " + answer[1] + " " + answer[2] + " " + answer[3]
        end
end
