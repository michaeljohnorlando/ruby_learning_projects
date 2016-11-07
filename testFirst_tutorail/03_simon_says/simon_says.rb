def echo input
    input
end

def shout input
    input.upcase
end

def repeat (input,amount=2)
    ((input+' ') * amount).chomp(' ')
end

def start_of_word input, amount
    input[0,amount]
end

def first_word input,amount = 1
    words = input.scan(/\w+/)
    x=0
    answer = ''
    until x == amount
       answer += words[x]
       x += 1
    end
    return answer
end

def titleize input
    input.split.map(&:capitalize).join(' ')
end