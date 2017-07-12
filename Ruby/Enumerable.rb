module Enumerable
    def my_each
        counter = 0
        while counter < self.size
            yield(self[counter])
            counter += 1
        end
    end
    
    def my_each_with_index
        self.class == Range ? array = self.to_a : array = self
        for index in 0...array.size 
            yield(array[index],index)
        end
    end
    
    def my_select                         
        my_each {|thing| yield(thing) if yield(thing)}
    end
    
    def my_all?
        if block_given? 
            my_select {|thing| return false if yield(thing) != true}
            return true
        else 
            return false
        end
    end
    
    def my_any?
        if block_given? 
            my_select {|thing| return true if yield(thing) == true}
            return false
        else 
            return true
        end
    end 
    
    def my_none?
        if block_given? 
            my_select {|thing| return false if yield(thing) == true}
            return true
        else 
            return true
        end
    end 
    
    def my_count(counting_thing = nil)
        counter = 0
        my_select {|thing| counting_thing}
        if counting_thing == nil
            return self.size
        else
            return counter
        end
    end
    
    def my_map
        new_array = []
        my_each {|thing| new_array << yield(thing)}
        return new_array
    end
    
    def my_inject(injecting = nil)
                    arr = self.to_a
                    total = 0 #multiply problems...
                    total = injecting if injecting != nil
        if injecting != nil
            arr.my_each {|thing| total = yield(total,thing)}
        else
            arr.my_each {|thing| total = yield(total,thing)}
        end
        return total
    end
end