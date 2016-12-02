class Book
    def title=(input)
        input         = input.split(' ')
        words         = []
        conjunctions  = ['for','and','nor','but','or','yet','so']
        prepositions  = ['above', 'about', 'across', 'against', 'along', 'among', # common prepositions...
                         'around', 'at', 'before', 'behind', 'below', 'beneath', 'beside', 'between', 'beyond', 'by', 'a',
                         'down', 'during', 'except', 'for', 'from', 'in', 'inside', 'into', 'like', 'near', 'of', 'off', 'an',
                         'on', 'since', 'to', 'toward', 'through', 'under', 'until', 'up', 'upon', 'with', 'within','the']
        input.each {|word| if conjunctions.include? word or prepositions.include? word  then words << word else words << word.capitalize end}
        words[0] = words[0].capitalize # first letter
        @title=words.join(" ")
    end
    def title
        @title
    end
end
