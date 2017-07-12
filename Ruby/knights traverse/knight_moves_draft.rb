class Node
    attr_accessor :value,:parent,:children,:location
    def initialize(value)
        @value        = value
        @parent       = nil
        @location     = nil
        @children     = []
    end
end
class Move_tree

end

class Knight
  attr_accessor :postion
  def initialize(value)
    @postion  = value  # [x,y] array
  end
  def posible_moves(postion = @postion)
      possible_moves = []
      possible_moves[0] = [postion[0] + 2,postion[1] + 1]
      possible_moves[1] = [postion[0] + 2,postion[1] - 1]
      possible_moves[2] = [postion[0] - 2,postion[1] + 1]
      possible_moves[3] = [postion[0] - 2,postion[1] - 1]
      possible_moves[4] = [postion[0] + 1,postion[1] + 2]
      possible_moves[5] = [postion[0] - 1,postion[1] + 2]
      possible_moves[6] = [postion[0] + 1,postion[1] - 2]
      possible_moves[7] = [postion[0] - 1,postion[1] - 2]

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

def game_board
  board = []
  i     = 1
  i2    = 1
  (0..7).each do |i|
    board[i] = []
    (0..7).each do |i2|
      board[i][i2] = [nil,nil]
      #print board[i][i2]
    end
    #puts""
  end
end

#                             initial position                    ... is the root
#                     /            |               \
#            possible_move1     possible_move1      possible_move1   .... as many moves as possible... x.y cordinate << array

def tree_array_creation(wanted_knight_position,start_position) #starting position of knight
  tree_array = [] # where all nodes will be stored
  #############################################################################
  #creates knight root node at [0][0]
  array = []
  knight        = Knight.new(start_position)
  root          = Node.new(knight.postion)
  root.location = [0,0]
  knight_valid_moves = valid_move_check(knight.posible_moves)
  knight_valid_moves.each do |valid_move|
  root.children << valid_move
  end
  array << root
  tree_array <<  array
  puts "\n starting root at = #{root.location} \n\n"
###############################################################################
# createing nodes untill knight is at move location...
depth = 1
branch  = 0
array = []
destination_reached = false
location_array = []
location_array_next = []
alternate = 1
location_array << [0,0] #where it starts...
while(destination_reached == false)
  depth     += 1
  branch    += 1
  run_count  = 0
  while (destination_reached == false && location_array.size >= 0)
    array = []
    run_count += 0
    if alternate == 0
      children_to_check = location_array_next
    else
      children_to_check = location_array
    end
    puts "****location of current children check #{children_to_check[-1]}**** alternate value = #{alternate}\n\n"
    if alternate == 0
      loc_current = location_array_next.pop
    else
      loc_current = location_array.pop
    end

    tree_array[loc_current[0]][loc_current[1]].children.each do |possible_move1|
      knight.postion   = possible_move1
      move_name        = Node.new([possible_move1[0],possible_move1[1]])
      move_name.parent = tree_array[depth-1][branch].value
      move_name.location = [depth,run_count]
      knight_valid_moves = valid_move_check(knight.posible_moves)
        knight_valid_moves.each do |valid_move|
          move_name.children << valid_move
        end
      puts "the new nodes move = #{move_name.value}  LOCATION = #{move_name.location}"
      puts "----possible moves from there = #{move_name.children}"
      run_count += 1

      if alternate == 0
        loc_current = location_array_next.pop
        location_array << move_name.location
      else
        loc_current = location_array.pop
        location_array_next << move_name.location
      end

      array << move_name
      if move_name.children.any? { |e| e == wanted_knight_position  }
        puts "\n ----------------------------------------"
        puts "a knights path reached its destination #{wanted_knight_position}... from #{start_position}"
        puts " ----------------------------------------"
        tree_array << array
        destination_reached = true
        break
      end

      if alternate == 0
        children_to_check = location_array
      else
        children_to_check = location_array_next
      end
      puts " ADDED TO NEXT CHECK... -------#{children_to_check}\n\n"

    end
    tree_array << array
    puts "----------------------next-------------------------- #{location_array_next}"

    if alternate == 0
      alternate += 1
    else
      alternate -= 1
    end

  end
  depth += 1
end
  return tree_array
end

def path_taken(posible_moves,destination)
  path = []
  path << destination

  #this finds the
  posible_moves.each do |thing|#[thing][1].value
    thing.each do |thing2|     #[thing][thing2].value  ... checks every possible move
      if (thing2.children.any? { |e| e == path[-1]  })  && thing2.value != posible_moves[0][0].value
        path << thing2.value
        path << thing2.parent
        @step_one = true
        break
      end
    end
    if @step_one == true
      break
    end
  end

  posible_moves.each do |thing|#[thing][1].value
    thing.each do |thing2|     #[thing][thing2].value  ... checks every possible move
      #puts "checking ag  #{path[-1]} #{thing2.value}"
      if (thing2.value == path[-1]  && thing2.value != posible_moves[0][0].value)
        path << thing2.parent
        break
      end
    end
  end

    path << posible_moves[0][0].value #the start
    return path.reverse
end

start_coordinate = [0,0]
end_coordinate   = [7,7]
array = tree_array_creation(end_coordinate,start_coordinate)
puts "\n"
#print array               #[1][1].value
puts "\n"
puts "from #{start_coordinate} to #{end_coordinate}\n"
puts "the path taken was #{path_taken(array,end_coordinate)}"
game_board
#knight = Knight.new
# setting the initial position
#knight.postion_x = 0
#knight.position_y = 0

# possible_moves to valid moves
#knight_posible_moves = knight.posible_moves
#puts " \n all of the possible_moves for the knight are"
#print knight_posible_moves
#puts " \n\n all of the valid_moves for the knight are"
#knight_valid_moves = valid_move_check(knight_posible_moves)
#print knight_valid_moves

# a way to create the tree.. need to know how many children are required per node
#puts "   --therfore #{knight_valid_moves.size} valid_moves_possible"
#valid_moves_possible = knight_valid_moves.size
