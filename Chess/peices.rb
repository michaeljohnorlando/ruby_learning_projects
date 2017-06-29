class Knight # Kn
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Kn#{color}"
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
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Bi#{color}"
  end
  def name
    return @name
  end
end
class Queen  # Qu
  attr_accessor :position,:color,:name
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Qu#{color}"
  end
end
class King   # Ki
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Ki#{color}"
  end
  def name
    return @name
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
    $board[x][y] = copypeice
    $board[from[1]][from[0]] = nil
  end
end

$board = create_game_board    #new empty board 8x8 Global
int_setup                     #populate board with objects (peices)
display_board

#testing pawn things...
x=2
y=1
puts "\n possible moves for x:#{x},y:#{y}"
print $board[y][x].possible_moves # y,x
puts "\n"

move_piece([2,6],[2,2])
display_board
puts "\n possible moves for x:#{x},y:#{y}"
print $board[y][x].possible_moves
