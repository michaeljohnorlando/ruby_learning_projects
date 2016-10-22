# i think next time ill sudocode ... because this got slopy as it went...
# AI deff could be better....

#all instance variables
@the_board = 
       ["\n███████████████████████████"," ", "\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████          <<COLORS SELECTION>>   (HIT ENTER TO QUIT)\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████          >> Q,W,E,R,T,Y,U,I\n"],   
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████        Right place & Right color >> O \n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████        Wrong place & Right color >> Ø \n"],   
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████"," ","\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████","     1) Start Game VS AI MASTERMIND","\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████","     2) Start Game VS DUMB AI with your code","\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████","     3) Start Game VS SMARTER AI with your code","\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████\n"],
    ["█ ","|"," ","|"," ","|"," ","|"," ","|","  █  ","|"," ","|"," ","|"," ","|"," ","|"," █",
        "\n███████████████████████████\n"]
@colors_selection = ["Q","W","E","R","T","Y","U","I"]
@player_move_count_x = 1
@player_move_count_y = 2
@valid_move_count    = 0

def display_board
    @the_board.each {|x1| x1.each {|x2| print x2}}
end
def display_title
    mastermind_logo = [
        "\n\n\n",
'███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗',
'████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗',
'██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║',
'██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║',
'██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝',
'╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝',].join("\n")
    puts mastermind_logo
end
def display_win
    win_logo = [
        "\n\n\n",
'██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗██╗███╗   ██╗',
'╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██║████╗  ██║',
' ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║██╔██╗ ██║',
'  ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║██║╚██╗██║',
'   ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝██║██║ ╚████║',
'   ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝',]
    puts win_logo
end
def display_lose
       puts "\n\n\n\n\n\n\n\n\n
'                                                               \n
▓██   ██▓ ▒█████   █    ██     ██▓     ▒█████    ██████ ▓█████  \n
 ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒    ▒██▒  ██▒▒██    ▒ ▓█   ▀  \n
  ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░    ▒██░  ██▒░ ▓██▄   ▒███    \n
  ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░    ▒██   ██░  ▒   ██▒▒▓█  ▄  \n
  ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒░ ████▓▒░▒██████▒▒░▒████▒ \n
   ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░░ ▒░ ░ \n
 ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░    ░ ░ ▒  ░  ░ ▒ ▒░ ░ ░▒  ░ ░ ░ ░  ░ \n
 ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░      ░ ░   ░ ░ ░ ▒  ░  ░  ░     ░    \n
 ░ ░         ░ ░     ░            ░  ░    ░ ░        ░     ░  ░ \n
 ░ ░                                                            \n
 \n\n\n\n\n\n"
end
 
def player_move(ai_rand_code,move = "then robot i assume? currently...")
    @valid_move_count += 1 
    @the_board[8][22] = "              MAKE A MOVE!! (#{@player_move_count_x},#{@player_move_count_y})"
    @the_board[9][22] = ""    # selection 2 clear
    @the_board[10][22] = ""   # selection 3 clear
    display_title
    display_board
    if move == "human Playing currently"
        @player_selection = gets.chomp
        @player_selection = @player_selection.upcase
    elsif move.kind_of?(Array)    # choice 2... random selection from colors
        @player_selection = move.sample
    else
        @player_selection = move   #choice 3 ... the robot want's to be human
    end
    
    if @colors_selection.include? @player_selection
        @the_board[@player_move_count_x][@player_move_count_y] = @player_selection
        @player_move_count_y += 2
        @the_board[7][22] = ""  # clears notifications
        if @player_move_count_y == 10
            move_check(ai_rand_code) ###### before change?
            @player_move_count_x += 1
            @player_move_count_y = 2
        end
    else
        if @win != true
        @the_board[7][22] = "            #{@player_selection} is NOT a valid color!!"
        @valid_move_count -= 1
        else
            @the_board[8][22] = ""
        end
    end
    display_title
    display_board
end
def move_check(code)
        x          = @player_move_count_x 
        y_check    = 2
        y_print    = 12
        code_new   = code.dup
        code_clue  = []
        
        code_count = 0
        4.times do   # checks for right place and color and removes them from the array
            if @the_board[x][y_check] ==  code_new[code_count]
                code_new[code_count] = "O"
                code_clue << "O"
            end
        y_check  += 2
        code_count += 1
        end

        y_check -= 8
        code_count = 0
        4.times do   # checks remainder for right color
            if code_new.include? @the_board[x][y_check]
                code_new [code_new.index(@the_board[x][y_check])] = "Ø"
                code_clue << "Ø"
            end
            y_check += 2
        end
        
        code_clue.each do |pin| # printing clue on board
            if pin == "O" || pin == "Ø"
                @the_board[x][y_print] = pin
            else
                @the_board[x][y_print] = " "
            end
        y_print += 2
        end
        
        if code_clue.all? {|a| a == "O"} && code_clue.count == 4
            @win = true
        end
        @the_board[7][22] = " code=#{code_new}      codeclue=#{code_clue} valid_move_count=#{@valid_move_count}"
    #puts "code_clue:#{code_clue}  code:#{code}  valid_move_count:#{@valid_move_count}"
end
def ai_code_generator
    ai_selection = [] # clears the array to generate new code // no save
    4.times {ai_selection << @colors_selection.sample}
    return ai_selection
end
def human_code_generator
    human_selection = [] # clears the array to generate new code // no save
    until human_selection.count == 4 
        letter = gets.chomp
        letter = letter.upcase
        if @colors_selection.include? letter
            human_selection << letter
            @the_board[7][22] = "     Current_code:#{human_selection}"
            display_title
            display_board
        else
            @the_board[7][22] = "            #{letter} is NOT a valid color!!"
            display_title
            display_board
        end
    end
    return human_selection
end

def array_move(arr,code_generated)
    arr.each do |arr_part|
        player_move(code_generated,arr_part)
    end
end
def smarter_ai_correct_colors(code_generated)
    # 1- all one letter untill it has 4 correct pins
    try     = []
    correct = []
    y       = @player_move_count_y + 4# is 10 items right in array
    x       = @player_move_count_x
    
    @colors_selection.each do |color| 
        if @valid_move_count != (4*12) || @win != true && was_this_run < 1
            try = []
            4.times do
                try << color
            end
            try.each do |color_all_same|
                if correct.count != 4
                    player_move(code_generated,color_all_same)
                end
            end
            y = 10
            4.times do 
                display_board
                if correct.count != 4
                    if @the_board[x][y] == "O"
                        correct << color
                    end
                end
                y += 2
            end
            x += 1
        end
    end
    return correct
end
def smarter_ai_fix_order(code_generated,correct_start)
    counter = 0
    x = @player_move_count_x 
    
    2.times do
        player_move(code_generated,correct_start[0])
    end
    2.times do
        player_move(code_generated,correct_start[1])
    end
    2.times do
        player_move(code_generated,correct_start[0])
        player_move(code_generated,correct_start[1])
    end
    
    r1c1 = @the_board[x][12]
    r1c2 = @the_board[x][14]
    r2c1 = @the_board[x+1][12]
    r2c2 = @the_board[x+1][14]
    
        if r1c1 == "O" && r1c2 == "O"
            if r2c1 == "O" && r2c2 == "O"
                whats_next = "OOOO"
            elsif r2c1 == "Ø" && r2c2 == "Ø"
                whats_next = "OOØØ"
            end
        end
        if r1c1 == "Ø" && r1c2 == "Ø"
            if r2c1 == "Ø" && r2c2 == "Ø"
                whats_next = "ØØØØ"
            elsif r2c1 == "O" && r2c2 == "O"
                whats_next = "ØØOO"
            end
        end
            #print "  whats_next=#{whats_next} r1c1:#{r1c1} r1c2:#{r1c2} r1c1:#{r2c1} r2c2:#{r2c2}          \n\n  "
    return whats_next
end

def smarter_ai(code_generated)
    correct = smarter_ai_correct_colors(code_generated)
    counter = 0
    x       = @player_move_count_x
    whats_next = 0
    how_many_of_each = correct.each_with_object(Hash.new(0)) { |color,counts| counts[color] += 1 }
    
    if how_many_of_each.any?  {|word,amount| amount == 3}  #when there are 3 of the same
        until @valid_move_count == (4*12) || @win == true
            correct_shifting = correct.shift
            correct = correct << correct_shifting
            array_move(correct,code_generated)
        end
    end
    
    two = 0
    how_many_of_each.each  {|word,amount| two += 1 if amount == 2}
    if two == 1
        until @valid_move_count == (4*12) || @win == true
            correct_shifting = correct.shift
            correct = correct << correct_shifting
            array_move(correct,code_generated)
        end
    end
        
    until @valid_move_count == (4*12) || @win == true
        if counter == 0
            until whats_next == "OOOO" || whats_next == "OOØØ" || whats_next == "ØØØØ" || whats_next == "ØØOO" || @valid_move_count == (4*10)
                correct       = correct.shuffle
                whats_next = smarter_ai_fix_order(code_generated,correct)
            end
        end

            right_stuff = ["?","Q","Q","Q"]
            @put_where   = []
            case whats_next
                when "OOØØ"
                    @the_board[x][2] != @the_board[x+1][2] ? right_stuff[0] = @the_board[x][2] :  @put_where  << 0
                    @the_board[x][4] != @the_board[x+1][4] ? right_stuff[1] = @the_board[x][4] :  @put_where  << 1
                    @the_board[x][6] != @the_board[x+1][6] ? right_stuff[2] = @the_board[x][6] :  @put_where  << 2
                    @the_board[x][8] != @the_board[x+1][8] ? right_stuff[3] = @the_board[x][8] :  @put_where  << 3
                    right_stuff[@put_where[0]] = correct[3]
                    right_stuff[@put_where[1]] = correct[2]
                    array_move(right_stuff,code_generated)
                when "ØØOO"
                    @the_board[x][2] != @the_board[x+1][2] ? right_stuff[0] = @the_board[x+1][2] :  @put_where  << 0
                    @the_board[x][4] != @the_board[x+1][4] ? right_stuff[1] = @the_board[x+1][4] :  @put_where  << 1
                    @the_board[x][6] != @the_board[x+1][6] ? right_stuff[2] = @the_board[x+1][6] :  @put_where  << 2
                    @the_board[x][8] != @the_board[x+1][8] ? right_stuff[3] = @the_board[x+1][8] :  @put_where  << 3
                    right_stuff[@put_where[0]] = correct[3]
                    right_stuff[@put_where[1]] = correct[2]
                    array_move(right_stuff,code_generated)
                when "ØØØØ"
                    @the_board[x][2] == @the_board[x+1][2] ? right_stuff[0] = @the_board[x][8] :  @put_where  << 0
                    @the_board[x][4] == @the_board[x+1][4] ? right_stuff[1] = @the_board[x][8] :  @put_where  << 1
                    @the_board[x][6] == @the_board[x+1][6] ? right_stuff[2] = @the_board[x][2] :  @put_where  << 2
                    @the_board[x][8] == @the_board[x+1][8] ? right_stuff[3] = @the_board[x][2] :  @put_where  << 3
                    right_stuff[@put_where[0]] = correct[3]
                    right_stuff[@put_where[1]] = correct[2]
                    array_move(right_stuff,code_generated)
                when "OOOO"
                    @the_board[x][2] == @the_board[x+1][2] ? right_stuff[0] = @the_board[x][2] :  @put_where  << 0
                    @the_board[x][4] == @the_board[x+1][4] ? right_stuff[1] = @the_board[x][4] :  @put_where  << 1
                    @the_board[x][6] == @the_board[x+1][6] ? right_stuff[2] = @the_board[x][6] :  @put_where  << 2
                    @the_board[x][8] == @the_board[x+1][8] ? right_stuff[3] = @the_board[x][8] :  @put_where  << 3
                    right_stuff[@put_where[0]] = correct[3]
                    right_stuff[@put_where[1]] = correct[2]
                    array_move(right_stuff,code_generated)
            end
    
            # test swap last 2
            if right_stuff[0] != "?"
                right_stuff[@put_where[0]] = correct[2]
                right_stuff[@put_where[1]] = correct[3]
                array_move(right_stuff,code_generated)
            else
                correct = correct.shuffle
                array_move(correct,code_generated)
            end
        counter += 1
    end
end
    
###############################################################################
###############################################################################
display_title
display_board
selection = gets.chomp.to_i

if selection == 1 # game vs AI
    code_generated = ai_code_generator
    until @valid_move_count == (4*12) || @win == true

        if @win != true
            player_move(code_generated,"human Playing currently")
        end
    end

    
    if @win == true
        display_win
        display_title
    else
        display_lose
        puts "the code was #{code_generated} \n\n\n"
    end
end

if selection == 2 # DUMB AI vs your code
    @the_board[8][22] = "              Make Your 4 color code"
    @the_board[9][22] = "              ...only from color selection above"
    display_title
    display_board
    code_generated = human_code_generator
    until @valid_move_count == (4*12) || @win == true
        if @win != true
            player_move(code_generated,@colors_selection)
        end
    end
    
    if @win == true
        display_lose
        puts "the code was #{code_generated} \n\n\n"
    else
        display_win
        display_title
        puts "the code was #{code_generated} \n\n\n"
    end
else 
    puts "Good Bye =)"
end

if selection == 3 # smarter AI vs your code
    @the_board[8][22] = "              Make Your 4 color code"
    @the_board[9][22] = "              ...only from color selection above"
    display_title
    display_board
    code_generated = human_code_generator
    smarter_ai(code_generated)
    
    if @win == true
        display_lose
        puts "the code was #{code_generated} \n\n\n"
    else
        display_win
        display_title
        puts "the code was #{code_generated} \n\n\n"
            puts "#{@put_where}"
    end
else 
    puts "Good Bye =)"
end