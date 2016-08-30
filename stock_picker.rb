# http://www.theodinproject.com/ruby-programming/building-blocks
#Implement a method #stock_picker that takes in an array of stock prices,
#one for each hypothetical day. It should return a pair of days representing
#the best day to buy and the best day to sell. Days start at 0.
#sooo basicly there saying the stock net is 0 at the end of the day... odd: confused me, why not depict more realistic chart/data??
# like a matrix... 1 day per main index and a sub index with 24 values representing each hour?... and not end at 0...
def stock_picker(stock_prices)
    possible_answer = 0
    
    stock_prices.each_with_index do |day_price1,index1|              # the _with_index  allows me to know the index on each iteration 
        stock_prices.each_with_index do |day_price2,index2|
            if  day_price2 - day_price1  > possible_answer and index2 > index1
                possible_answer = day_price2 - day_price1
                puts "Backtest best possible trade = $#{possible_answer} (#{day_price2} - #{day_price1})  // buy day = #{index1 + 1}, sell day = #{index2 + 1}"
            end
        end
    end
    # could just put the answer here but I like seeing it go through the if statement...
end

stock_picker([17,3,6,9,15,8,6,1,10])
