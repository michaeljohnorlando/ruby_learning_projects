class Knight # Kni
  attr_accessor :position
  def initialize(value)
    @position  = value  # [x,y] array
  end
  def posible_moves(position = @position)
      possible_moves = []
      possible_moves[0] = [position[0] + 2,position[1] + 1]
      possible_moves[1] = [position[0] + 2,position[1] - 1]
      possible_moves[2] = [position[0] - 2,position[1] + 1]
      possible_moves[3] = [position[0] - 2,position[1] - 1]
      possible_moves[4] = [position[0] + 1,position[1] + 2]
      possible_moves[5] = [position[0] - 1,position[1] + 2]
      possible_moves[6] = [position[0] + 1,position[1] - 2]
      possible_moves[7] = [position[0] - 1,position[1] - 2]
      return possible_moves
  end
end
class Rook # Rok
  attr_accessor :position
  def initialize(value)
    @position  = value  # [x,y] array
  end
  def posible_moves(position = @position)
    x = position[0]
    y = position[1]
    possible_moves = []
    while count < 8 #7 max in any direction
      #up
      if spot_taken([x,(y + count)]) == false
        possible_moves << [x,(y + count)]
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

def spot_taken(position)
  if position != nil
    return false
  else
    return true
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
def display_board(board)
  print "  0   1   2   3   4   5   6   7"
  count = 0
  board.each do |row|
    puts "\n -------------------------------- "
    row.each do |node|
      if node == nil
        print "|   "
      else
        print "|#{node}"
      end
    end
    print "| #{count}"
    count += 1
  end
  puts "\n -------------------------------- "
end

#new empty board 8x8
board = create_game_board
#populate board   last part of name designates B=black W=white
board[0][1] = 'KnB'
board[0][6] = 'KnB'

board[1][1] = 'PwB'

display_board(board)
