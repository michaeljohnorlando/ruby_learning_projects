require 'benchmark'

def fib_iteration(number)
  if number <= 0
    puts "N/A"
  else 
    fib = [1,1]                     #used the first 2 in pattern
    until number <= fib[-1]         #didn't do == (in case the number isn't part of the fib sequence the loop wont end)
      fib <<  fib[-1] + fib[-2]
    end
    print "#{fib} \n Time to do iteration: "
  end
end

def fib_recursion(number_given,array = [0,1])
  array << array[-1] + array[-2] if array.last < number_given
  if number_given <= 0
    print "the given number is less than or = to 0"
  elsif array.last >= number_given
    print "#{array} \n Time to do recursion: "
  else
    fib_recursion(number_given,array)
  end
end




puts Benchmark.measure {fib_recursion(20000)}
print "\n the iteration takes below amount of time \n"
puts Benchmark.measure {fib_iteration(20000)}