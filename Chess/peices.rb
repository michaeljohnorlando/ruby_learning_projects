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
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Qu#{color}"
  end
  def name
    return @name
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
  attr_accessor :position,:color
  def initialize(position,color)
    @position  = position  # [x,y] array
    @name      = "Pw#{color}"
  end
  def name
    return @name
  end
end

def spot_taken(position)
  if position != nil
    return false
  else
    return true
  end
end
def color_of_peice(position)
  return position[-1]
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
def display_board(board)
  print "  0   1   2   3   4   5   6   7"
  count = 0
  board.each do |row|
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
  puts "\n\n _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n\n"
end
def int_setup(board)
  #populate board   last part of name designates B=black W=white
  counter = 0
  #place Rooks
  rook = Rook.new([0][0],'B')
  board[0][0] =  rook
  rook = Rook.new([0][7],'B')
  board[0][7] = rook
  rook = Rook.new([7][0],'W')
  board[7][0] = rook
  rook = Rook.new([7][7],'W')
  board[7][7] = rook
  #place knights
  knight = Knight.new([0][1],'B')
  board[0][1] = knight
  knight = Knight.new([0][6],'B')
  board[0][6] = knight
  knight = Knight.new([7][1],'W')
  board[7][1] = knight
  knight = Knight.new([7][6],'W')
  board[7][6] = knight
  #place bishops
  bishop = Bishop.new([0][2],'B')
  board[0][2] = bishop
  bishop = Bishop.new([0][5],'B')
  board[0][5] = bishop
  bishop = Bishop.new([7][2],'W')
  board[7][2] = bishop
  bishop = Bishop.new([7][5],'W')
  board[7][5] = bishop
  #place queens
  queen = Queen.new([0][3],'B')
  board[0][3] = queen
  queen = Queen.new([7][3],'W')
  board[7][3] = queen
  #place kings
  king = King.new([0][4],'B')
  board[0][4] = king
  king = King.new([7][4],'W')
  board[7][4] = king
  #place pawns
  board[1].each do |place_pawn|
    pawn = Pawn.new([1][counter],'B')
    board[1][counter] = pawn
    pawn = Pawn.new([6][counter],'W')
    board[6][counter] = pawn
    counter += 1
  end
end
def move_piece(board,from,to)
  x = from[1]
  y = from[0]
  copypeice = board[x][y]
  board[x][y] = nil
  ########################################
  x = to[1]
  y = to[0]
  board[x][y] = copypeice
end
#new empty board 8x8
board = create_game_board
#populate board object's   last part of name designates B=black W=white..
int_setup(board)
display_board(board)
move_piece(board,[0,1],[0,3])
display_board(board)
