def add num1,num2
    num1+num2
end

def subtract num1,num2
    num1-num2
end

def sum array
    answer = 0
    array.each do |num| 
        answer += num
    end
    return answer
end

def multiply arr
    answer = arr[0]
    arr.shift
    arr.each {|num| answer *= num}
    return answer
end

def power num1,num2
    num1**num2
end

def  factorial num
    count = 0
    answer = 1
    
    if num == 0
        return 1
    else
        until count == num
            count += 1
            answer *= count
        end
        return answer
    end
end