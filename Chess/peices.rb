class Knight # Kn
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Kn#{color}"
    @color     = color
  end
  def name
    return @name
  end
  def posible_moves
    x = @position[0]
    y = @position[1]
      possible_moves = []
      possible_moves[0] = [x + 2, y + 1]
      possible_moves[1] = [x + 2, y - 1]
      possible_moves[2] = [x - 2, y + 1]
      possible_moves[3] = [x - 2, y - 1]
      possible_moves[4] = [x + 1, y + 2]
      possible_moves[5] = [x - 1, y + 2]
      possible_moves[6] = [x + 1, y - 2]
      possible_moves[7] = [x - 1, y - 2]
      return possible_moves
  end
end
class Rook   # Ro
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Ro#{color}"
    @color     = color
  end
  def name
    return @name
  end
  def posible_moves(board)
    x = @position[0]
    y = @position[1]
    possible_moves = []
    while count < 8 #7 max in any direction
      #up
      position = [x,(y + count)]
      if spot_taken(position) == false
        possible_moves << position
      end
      #down
      if spot_taken([x,(y + count* -1)]) == false
        possible_moves << [x,(y  + (count* -1))]
      end
      #right
      possible_moves << [(x + count),y]
      #left
      possible_moves << [x + (count* -1),y]
      count += 1
      possible_moves = valid_move_check(possible_moves)
      return possible_moves
    end
  end
end
class Bishop # Bi
  attr_accessor :position,:color,:name
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Bi#{color}"
    @color     = color
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
    possible_moves = possible_moves.uniq
    return possible_moves
  end
end
class Queen  # Qu
  attr_accessor :position,:color,:name
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Qu#{color}"
    @color     = color
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
    possible_moves = possible_moves.uniq
    return possible_moves
  end
end
class King   # Ki    (need to go back to... all possible_moves needed to check if moveing into check...)
  attr_accessor :position,:color,:name
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Ki#{color}"
    @color     = color
  end
  def possible_moves
    y = @position[0]
    x = @position[1]
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
    return possible_moves
  end
end
class Pawn   # Pw
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
    possible_moves = valid_move_check(possible_moves)
    return possible_moves
  end
end

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
  #populate board   last part of name designates B=black W=white
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
  king = King.new([0,4],'B')
  $board[0][4] = king
  king = King.new([7,4],'W')
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
  puts "\n checking x:#{x},y:#{y}"
  if (x == 0 || x == 7) && ($board[from[1]][from[0]].type == 'pawn')
    queen = Queen.new([y,x],$board[from[1]][from[0]].color)
    $board[x][y] = queen
    $board[from[1]][from[0]] = nil
  ##############################################
  else
    copypeice.position = [x,y]############################################################# this might be backwards...
    $board[x][y] = copypeice
    $board[from[1]][from[0]] = nil
  end
end

$board = create_game_board    #new empty board 8x8 Global
int_setup                     #populate board with objects (peices)
display_board

#testing the peice things...
x=2
y=7
puts "\n possible moves for peice at x:#{x},y:#{y}"
print $board[y][x].possible_moves
puts "\n"

move_piece([3,6],[3,4])
display_board
puts "\n possible moves for for peice at x:#{x},y:#{y}"
print $board[y][x].possible_moves
