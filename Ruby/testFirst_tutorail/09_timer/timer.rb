class Timer
    def initialize
        @seconds     = 0
        @time_string = '00:00:00'
    end
    
    def seconds=(input)
        @seconds=input
        from_sec(input)
        @dhs = @time_string.split(':')
        
        one_num?(@sec,2)
        one_num?(@minutes,1)
        one_num?(@hours,0)
        
        @time_string = @dhs.join(":")
    end
    
    def seconds
        @seconds
    end
    def time_string
        @time_string
    end
    
    def one_num?(number,section)
        if number < 10
            @dhs[section] = "0#{number}"
        else
            @dhs[section] = number
        end
    end
    def from_sec(number) # this could be shorter but I like the way "it reads"
        @sec     = number
        @minutes = @sec/60
        @hours   = @minutes/60
        @days    = @hours/24
        
        @hours   = @hours - @days*24
        @minutes = @minutes - @hours*60 - @days*1440
        @sec     = @sec - @minutes*60 - @hours*3600 - @days*86400
    end
    
end