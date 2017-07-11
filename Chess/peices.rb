$check = false
#########################################################################
# Every peice knows where its what color it is and where it can move to #
#########################################################################
class Knight # Kn
  attr_accessor :position,:color,:name, :type
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Kn#{color}"
    @color     = color
    @type      = 'Knight'
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
      possible_moves = [] #... there are 8 possibilitys
      if y+1 < 8 && x+2 < 8
        location = $board[y+1][x+2]
        possible_moves << [x+2,y+1] if location == nil || location.color != @color
      end
      if y-1 >= 0 && x+2 < 8
        location = $board[y-1][x+2]
        possible_moves << [x+2,y-1] if location == nil || location.color != @color
      end
      if y+1 < 8 && x-2 >= 0
        location = $board[y+1][x-2]
        possible_moves << [x-2,y+1] if location == nil || location.color != @color
      end
      if y-1 >= 0 && x-2 >= 0
        location = $board[y-1][x-2]
        possible_moves << [x-2,y-1] if location == nil || location.color != @color
      end
      if y+2 < 8 && x+1 < 8
        location = $board[y+2][x+1]
        possible_moves << [x+1,y+2] if location == nil || location.color != @color
      end
      if y+2 < 8 && x-1 >= 0
        location = $board[y+2][x-1]
        possible_moves << [x-1,y+2] if location == nil || location.color != @color
      end
      if y-2 >= 0 && x+1 < 8
        location = $board[y-2][x+1]
        possible_moves << [x+1,y-2] if location == nil || location.color != @color
      end
      if y-2 >= 0 && x-1 >= 0
        location = $board[y-2][x-1]
        possible_moves << [x-1,y-2] if location == nil || location.color != @color
      end
      possible_moves = valid_move_check(possible_moves)
      return possible_moves
  end
end
class Rook   # Ro
  attr_accessor :position,:color,:name, :type
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Ro#{color}"
    @color     = color
    @type      = 'Rook'
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
    # stops cheking in that ditrection when specific conditions are true
    up  = down = left = right = false
    diag_up_r = diag_up_l = diag_dw_r = diag_dw_l = false
    possible_moves = []
    1.upto(7) do |i|
      if y+i < 8 && down == false #down
        down = true if $board[y+i][x] != nil
        possible_moves << [x,y+i] if $board[y+i][x] == nil || $board[y+i][x].color != @color
      end
      if y-i >= 0 && up == false #Up
        up = true if $board[y-i][x] != nil
        possible_moves << [x,y-i] if $board[y-i][x] == nil || $board[y-i][x].color != @color
      end
      if x+i < 8 && right == false #right
        right = true if $board[y][x+i] == nil
        possible_moves << [x+i,y] if $board[y][x+i] == nil || $board[y][x+i].color != @color
      end
      if x-i >= 0 && left == false # left
        left = true if $board[y][x-i] != nil
        possible_moves << [x-i,y] if $board[y][x-i] == nil || $board[y][x-i].color != @color
      end
    end
    possible_moves = valid_move_check(possible_moves)
    return possible_moves
  end
end
class Bishop # Bi
  attr_accessor :position,:color,:name, :type
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Bi#{color}"
    @color     = color
    @type      = 'Bishop'
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
    # stops cheking in that ditrection when specific conditions are true
    diag_up_r = diag_up_l = diag_dw_r = diag_dw_l = false
    possible_moves = []
    1.upto(7) do |i|
      if x+i < 8 && y-i >= 0 && diag_up_r == false #diagonal up right
        diag_up_r = true if $board[y-i][x+i] != nil
        possible_moves << [x+i,y-i] if $board[y-i][x+i] == nil || $board[y-i][x+i].color != @color
      end
      if x+i < 8 && y+i < 8 && diag_dw_r == false #diagonal down right
        diag_dw_r = true if $board[y+i][x+i] != nil
        possible_moves << [x+i,y+i] if $board[y+i][x+i] == nil || $board[y+i][x+i].color != @color
      end
      if x-i >= 0 && y-i >= 0 && diag_up_l == false #diagonal up left 1,5
        diag_up_l = true if $board[y-i][x-i] != nil
        possible_moves << [x-i,y-i] if $board[y-i][x-i] == nil || $board[y-i][x-i].color != @color
      end
      if x-i >= 0 && y+i < 8 && diag_dw_l == false #diagonal down left
        diag_dw_l = true if $board[y+i][x-i] != nil
        possible_moves << [x-i,y+i] if $board[y+i][x-i] == nil || $board[y+i][x-i].color != @color
      end
    end
    possible_moves = valid_move_check(possible_moves)
    return possible_moves
  end
end
class Queen  # Qu
  attr_accessor :position,:color,:name, :type
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Qu#{color}"
    @color     = color
    @type      = 'Queen'
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
    # stops cheking in that ditrection when specific conditions are true
    up  = down = left = right = false
    diag_up_r = diag_up_l = diag_dw_r = diag_dw_l = false
    possible_moves = []
    1.upto(7) do |i|
    if y+i < 8 && down == false #down
      down = true if $board[y+i][x] != nil
      possible_moves << [x,y+i] if $board[y+i][x] == nil || $board[y+i][x].color != @color
    end
    if y-i >= 0 && up == false #Up
      up = true if $board[y-i][x] != nil
      possible_moves << [x,y-i] if $board[y-i][x] == nil || $board[y-i][x].color != @color
    end
    if x+i < 8 && right == false #right
      right = true if $board[y][x+i] != nil
      possible_moves << [x+i,y] if $board[y][x+i] == nil || $board[y][x+i].color != @color
    end
    if x-i >= 0 && left == false # left
      left = true if $board[y][x-i] != nil
      possible_moves << [x-i,y] if $board[y][x-i] == nil || $board[y][x-i].color != @color
    end
    if x+i < 8 && y-i >= 0 && diag_up_r == false #diagonal up right
      diag_up_r = true if $board[y-i][x+i] != nil
      possible_moves << [x+i,y-i] if $board[y-i][x+i] == nil || $board[y-i][x+i].color != @color
    end
    if x+i < 8 && y+i < 8 && diag_dw_r == false #diagonal down right
      diag_dw_r = true if $board[y+i][x+i] != nil
      possible_moves << [x+i,y+i] if $board[y+i][x+i] == nil || $board[y+i][x+i].color != @color
    end
    if x-i >= 0 && y-i >= 0 && diag_up_l == false #diagonal up left 1,5
      diag_up_l = true if $board[y-i][x-i] != nil
      possible_moves << [x-i,y-i] if $board[y-i][x-i] == nil || $board[y-i][x-i].color != @color
    end
    if x-i >= 0 && y+i < 8 && diag_dw_l == false #diagonal down left
      diag_dw_l = true if $board[y+i][x-i] != nil
      possible_moves << [x-i,y+i] if $board[y+i][x-i] == nil || $board[y+i][x-i].color != @color
    end
    end
    possible_moves = valid_move_check(possible_moves)
    return possible_moves
  end
end
class King   # Ki    (if moveing into check with king needs fixing...)
  attr_accessor :position,:color,:name, :type
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Ki#{color}"
    @color     = color
    @type      = 'King'
  end
  def possible_moves
    y = @position[1]
    x = @position[0]
    possible_moves = []
    if y+1 < 8
      possible_moves << [x,y+1] if $board[y+1][x] == nil || $board[y+1][x].color != @color
    end
    if y-1 >= 0
      possible_moves << [x,y-1] if $board[y-1][x] == nil || $board[y-1][x].color != @color
    end
    if x+1 < 8
      possible_moves << [x+1,y] if $board[y][x+1] == nil || $board[y][x+1].color != @color
    end
    if x-1 >= 0
      possible_moves << [x-1,y] if $board[y][x-1] == nil || $board[y][x-1].color != @color
    end
    if x+1 < 8 && y-1 >= 0
      possible_moves << [x+1,y-1] if $board[y-1][x+1] == nil || $board[y-1][x+1].color != @color
    end
    if x+1 < 8 && y+1 < 8
      possible_moves << [x+1,y+1] if $board[y+1][x+1] == nil || $board[y+1][x+1].color != @color
    end
    if x-1 >= 0 && y-1 >= 0
      possible_moves << [x-1,y-1] if $board[y-1][x-1] == nil || $board[y-1][x-1].color != @color
    end
    if x-1 >= 0 && y+1 < 8
      possible_moves << [x-1,y+1] if $board[y+1][x-1] == nil || $board[y+1][x-1].color != @color
    end
    possible_moves = valid_move_check(possible_moves)
    check_array = in_check
    check_array.each do |cant_go_here|
      possible_moves.each do |want_to_go_here|
        possible_moves.delete(cant_go_here) if  cant_go_here == want_to_go_here
      end
    end
    return possible_moves
  end
  def in_check
    # 1 itirate through every peice on the board that is not the same color
    pieces = []
    cant_go_here = []
    check_array = []
    $board.each do |row|
      row.each do |piece|
        if piece != nil && piece.color != @color
          #puts " #{piece.name}// piece.color #{piece.color}   @color #{@color}"
          pieces << piece
        end
      end
    end
    # 2 store their possible_moves in an single array
    pieces.each do |piece|
      # if the king is checked it loops endlisly.... with valid move check
      # ... my x and y messup reults in ugly...
      cant_go_here << piece.possible_moves if piece.name.chop != 'Ki'
      if piece.name.chop == 'Ki'
        y = piece.position[1]
        x = piece.position[0]
        other_kings_moves = []
        if y+1 < 8
        other_kings_moves << [x,y+1] if $board[y+1][x] == nil || $board[y+1][x].color == @color
        end
        if y-1 >= 0
        other_kings_moves << [x,y-1] if $board[y-1][x] == nil || $board[y-1][x].color == @color
        end
        if x+1 < 8
        other_kings_moves << [x+1,y] if $board[y][x+1] == nil || $board[y][x+1].color == @color
        end
        if x-1 >= 0
        other_kings_moves << [x-1,y] if $board[y][x-1] == nil || $board[y][x-1].color == @color
        end
        if x+1 < 8 && y-1 >= 0
        other_kings_moves << [x+1,y-1] if $board[y-1][x+1] == nil || $board[y-1][x+1].color == @color
        end
        if x+1 < 8 && y+1 < 8
        other_kings_moves << [x+1,y+1] if $board[y+1][x+1] == nil || $board[y+1][x+1].color == @color
        end
        if x-1 >= 0 && y-1 >= 0
        other_kings_moves << [x-1,y-1] if $board[y-1][x-1] == nil || $board[y-1][x-1].color == @color
        end
        if x-1 >= 0 && y+1 < 8
        other_kings_moves << [x-1,y+1] if $board[y+1][x-1] == nil || $board[y+1][x-1].color == @color
        end
        cant_go_here << other_kings_moves
      end
    end
    cant_go_here.each do |moves_for_piece|
      moves_for_piece.each do |move|
        check_array << move if move != nil
      end
    end
    return check_array
  end #will not work with check that has a peice defnding it...#########################################
end
class Pawn   # Pw    (has a special case in move_piece function)
  attr_accessor :position,:color,:type,:name
  def initialize(position,color)
    @position  = position  # [x,y] array
    @color     = color
    @name      = "Pw#{color}"
    @int_pos   = position
    @type      = 'pawn'
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
    possible_moves = []
    ##############
    # Going down #
    ##############
    if @color == 'B'
      #first move possibility
      if $board[y+1][x] == nil
        if @int_pos == @position
          possible_moves << [x,y+2]
        end
      end
      #normal move possibility
      if $board[y+1][x] == nil
        possible_moves << [x,y+1]
      end
      #attack move possibility
      if $board[y+1][x+1] != nil
        if $board[y+1][x+1].color != @color
          possible_moves << [x+1,y+1]
        end
      end
      if $board[y+1][x-1] != nil
        if $board[y+1][x-1].color != @color
          possible_moves << [x-1,y+1]
        end
      end
    end
    ##############
    # Going UP   #
    ##############
    if @color == 'W'
      #first move possibility
      if $board[y-1][x] == nil
        if @int_pos == @position
          possible_moves << [x,y-2]
        end
      end
      #normal move possibility
      if $board[y-1][x] == nil
        possible_moves << [x,y-1]
      end
      #attack move possibility
      if $board[y-1][x+1] != nil
        if $board[y-1][x+1].color != @color
          possible_moves << [x+1,y-1]
        end
      end
      if $board[y-1][x-1] != nil
        if $board[y-1][x-1].color != @color
          possible_moves << [x-1,y-1]
        end
      end
    end
    possible_moves = valid_move_check(possible_moves)
    return possible_moves
  end
end
################################################
#  Helper functions                            #
################################################
def valid_move_check(possible_moves)
  valid_moves = []
  possible_moves.each do |x_and_y|
    x = x_and_y[0]
    y = x_and_y[1]
    #puts "X= #{x}  Y= #{y}"
    if (x<=7 && x>=0 && y<=7 && y>=0)
      valid_moves << [x,y]
    else
      false
    end
  end
  return valid_moves
end
def create_game_board
  board = []
  i = 0
  i2 = 0
  while i < 8
    board << []
    i2 = 0
    while i2 < 8
      board[i] << nil
      i2 += 1
    end
    i += 1
  end
  return board
end
def display_board
  print "\n  0   1   2   3   4   5   6   7"
  count = 0
  $board.each do |row|
    puts "\n -------------------------------- "
    row.each do |node|
      if node == nil
        print "|   "
      else
        print "|#{node.name}"
      end
    end
    print "| #{count}"
    count += 1
  end
  puts "\n -------------------------------- "
  print "  0   1   2   3   4   5   6   7"
  puts "\n\n _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n"
end
def int_setup
  #################################################################
  # populate board   last part of name designates B=black W=white #
  #################################################################
  #place Rooks
  rook = Rook.new([0,0],'B')
  $board[0][0] =  rook
  rook = Rook.new([0,7],'B')
  $board[0][7] = rook
  rook = Rook.new([7,0],'W')
  $board[7][0] = rook
  rook = Rook.new([7,7],'W')
  $board[7][7] = rook
  #place knights
  knight = Knight.new([0,1],'B')
  $board[0][1] = knight
  knight = Knight.new([0,6],'B')
  $board[0][6] = knight
  knight = Knight.new([7,1],'W')
  $board[7][1] = knight
  knight = Knight.new([7,6],'W')
  $board[7][6] = knight
  #place bishops
  bishop = Bishop.new([0,2],'B')
  $board[0][2] = bishop
  bishop = Bishop.new([0,5],'B')
  $board[0][5] = bishop
  bishop = Bishop.new([7,2],'W')
  $board[7][2] = bishop
  bishop = Bishop.new([7,5],'W')
  $board[7][5] = bishop
  #place queens
  queen = Queen.new([0,3],'B')
  $board[0][3] = queen
  queen = Queen.new([7,3],'W')
  $board[7][3] = queen
  #place kings
  king = King.new([4,0],'B')
  $board[0][4] = king
  king = King.new([4,7],'W')
  $board[7][4] = king
  #place pawns
  counter = 0
  8.times do
    pawn = Pawn.new([1,counter],'B')
    $board[1][counter] = pawn
    pawn = Pawn.new([6,counter],'W')
    $board[6][counter] = pawn
    counter += 1
  end
end
def move_piece(from,to)
  ##### just copying the peice ###########
  x = from[1]
  y = from[0]
  copypeice = $board[x][y]
  ##############################################
  x = to[1]
  y = to[0] # the x and y order is confuseing...
  ######## special case needed for pawn ########
  if (x == 0 || x == 7) && ($board[from[1]][from[0]].type == 'pawn')
    queen = Queen.new([y,x],$board[from[1]][from[0]].color)
    $board[x][y] = queen
    put_opponet_in_check($board[x][y],@color)
    $board[from[1]][from[0]] = nil
  ##############################################
  else
    copypeice.position = [x,y]
    $board[x][y] = copypeice
    if put_opponet_in_check($board[x][y],@color) == true
      $check = true
    else
      $check = false
    end
    $board[from[1]][from[0]] = nil
  end
end
def player_move(color)
  puts "You are in check!" if $check
  can_i_move = true
  puts "\n select the peice you want to move (#{color})"
  print "x:"
  peice_selection_x = gets.chomp
  peice_selection_x = peice_selection_x.to_i
  print "y:"
  peice_selection_y = gets.chomp
  peice_selection_y = peice_selection_y.to_i
  from = [peice_selection_x,peice_selection_y]
  if $board[peice_selection_y][peice_selection_x] == nil
    puts '###################################################'
    puts '# THERE IS NO PIECE THERE --please select a piece #'
    puts '###################################################'
    display_board
    can_i_move = false
    player_move(color)
  elsif $board[peice_selection_y][peice_selection_x].color != color
    puts '########################################################'
    puts "# THAT is not your  peice... current color is #{color} #"
    puts '########################################################'
    display_board
    can_i_move = false
    player_move(color)
  elsif $board[peice_selection_y][peice_selection_x].possible_moves.all? { |e| e == [] }
    puts '########################################################################'
    puts '# NO MOVES POSSIBLE for that peice    --please select a diffrent piece #'
    puts '########################################################################'
    display_board
    can_i_move = false
    player_move(color)
  else
    puts "that peices possible moves are #{$board[peice_selection_y][peice_selection_x].possible_moves}"
    possible_moves = $board[peice_selection_y][peice_selection_x].possible_moves
  end
  if can_i_move
    puts "\n select where you want to move "
    print "x:"
    peice_move_x = gets.chomp
    peice_move_x = peice_move_x.to_i
    print "y:"
    peice_move_y = gets.chomp
    peice_move_y = peice_move_y.to_i
    to = [peice_move_x,peice_move_y]
    #check if valid move for that piece
    if $board[peice_selection_y][peice_selection_x].possible_moves.all? { |e| e != to }
      puts '####################################'
      puts '# not a valid move for that peice! #'
      puts '####################################'
      display_board
      can_i_move = false
      player_move(color)
    elsif $check
      # if king selected... just allow it to move.... it has its own check testing
      if $board[peice_selection_y][peice_selection_x].name.chop == 'Ki'
        #move the piece
        move_piece(from,to) if can_i_move
        display_board
      else
        $board.each do |row|
          row.each do |piece|
            if piece != nil && piece.color == color && piece.name.chop == 'Ki'
              puts " ARE YOU STILL IN CHECK???"
              puts " the check array... #{piece.in_check}"
              #save old position of piece that you are moveing... from
              save_to   = $board[peice_selection_y][peice_selection_x]
              save_from = $board[peice_move_y][peice_move_x]
              move_piece(from,to) if can_i_move
              if piece.in_check.any? { |e| e == piece.position if piece != nil }
                puts '###########################'
                puts '# You are still in check! #'
                puts '###########################'
                can_i_move = false
                # put peices back to saved locations
                $board[peice_selection_y][peice_selection_x] = save_to
                $board[peice_move_y][peice_move_x]           = save_from
                display_board
                $check = true
                player_move(color)
              else
                if can_i_move
                  puts "\n this needs to move the peices....\n\n"
                  display_board
                  $check = false
                end
              end
            end
          end
        end
      end
    else
      #move the piece
      move_piece(from,to) if can_i_move
      display_board
    end
  end
  return nil
end
def change_color(color)
  return 'B' if color == 'W'
  return 'W' if color == 'B'
end
def put_opponet_in_check(location,color)
  location.possible_moves.each do |coordinate|
    x = coordinate[0]
    y = coordinate[1]
    if $board[y][x] != nil
      if $board[y][x].name.chop == 'Ki' && $board[y][x].color != color
        puts '######################################'
        puts "# #{$board[y][x].color} is in Check! #"
        puts '######################################'
        return true
      end
    end
  end
end

###########################################################
#On chess. "It's a useful mental exercise. Through the    #
#years, many thinkers have been fascinated by it. But I   #
#don't enjoy playing... Because it was a game that was    #
#born during a brutal age when life counted for little.   #
#Everyone believed that some people were worth more than  #
#others. Kings. Pawns. I don't think that anyone is worth #
#more than anyone else... Chess is just a game. Real      #
#people are not pieces. You can't assign more value to    #
#some of them and not others. Not to me. Not to anyone.   #
#People are not a thing that you can sacrifice. The lesson#
#is, if anyone who looks on to the world as if it is a    #
#game of chess, deserves to lose. "                       #
###########################################################

$board = create_game_board    #new empty board 8x8 Global
int_setup                     #populate board with objects (peices)
player_color = 'W'            # w always goes first...
game_over    = false
display_board
while game_over == false
  player_move(player_color)
  puts "\n\n   CHECK!  \n" if $check
  player_color = change_color(player_color)
end


#testing the peice things...
#display_board
#puts "\n possible moves for for peice at x:#{x},y:#{y}"
#print $board[y][x].possible_moves
#move_piece([4,6],[4,4])
