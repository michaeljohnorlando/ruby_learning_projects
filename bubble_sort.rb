def bubble_sort(numbers)
    while !(numbers.each_cons(2).all? {|num1,num2| num1<=num2})
        index = 0
        numbers.each_cons(2) do |num1,num2|  
            numbers.insert(index, numbers.delete_at(index+1)) if num1 > num2
            index += 1
        end
    end
    return numbers
end

def bubble_sort_by(words)
    (words.size).times {
        words.each_with_index do |word,index|
            if yield(words[index],words[index+1]) > 0
                words.insert(index, words.delete_at(index+1))
            end
        end
    }
    return words
end


print bubble_sort([4,3,78,2,0,2])
puts ""
print bubble_sort_by(["B","da","E", "hello","S", "you","T","bacon"]) {|left,right| right.to_s.length - left.to_s.length}
puts ""

# puts  "#{num1},#{num2}"
# http://stackoverflow.com/questions/4733925/how-to-change-the-position-of-an-array-element
# http://stackoverflow.com/questions/15682223/ruby-array-access-2-consecutivechained-elements-at-a-time