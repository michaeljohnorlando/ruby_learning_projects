class Node
    attr_accessor :value,:parent,:children,:location
    def initialize(value)
        @value        = value
        @parent       = nil
        @location     = nil
        @children     = []
    end
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
def tree_array_creation(start,finish) #given as [x,y]
  tree_array = [] # where all nodes will be stored
  #                       initial position (root)[0][0,0]
  #                     /            |               \
  #      possible_move(b1)     possible_move(b2)      possible_move(b3)
  #        [1][0,0]                 [1][1,0]             [1][2,0]
  #
  #############################################################################
  #creates knight root node at [0][0,0]
  run_count     = 0 # for node location in array
  knight        = Knight.new(start)
  root          = Node.new(knight.postion)
  root.location = run_count
  root.parent   = nil
  knight_posible_moves = valid_move_check(knight.posible_moves)
  knight_posible_moves.each do |valid_move|
  root.children << valid_move
  end
  tree_array <<  root
  #############################################################################
  location_array_for_next_run = []
  this_run=[]

  tree_array[-1].children.each do |child_location|
    run_count += 1
    location_array_for_next_run << run_count
    children_temp_storge_array  = []
    possible_move               = Node.new(child_location)
    possible_move.location      = run_count
    possible_move.parent        = tree_array[0].value
    knight.postion              = possible_move.value
    knight_posible_moves        = valid_move_check(knight.posible_moves)
    knight_posible_moves.each do |valid_move|
      children_temp_storge_array << valid_move
    end
    possible_move.children = children_temp_storge_array
    tree_array << possible_move
  end
  ######### testing ################################
  are_we_there_yet = false##########################################################################
  until are_we_there_yet == true####################################################################
    while location_array_for_next_run.size > 0
      index_adding = location_array_for_next_run.pop
      tree_array[index_adding].children.each do |child_location|
        run_count += 1
        this_run << run_count
        children_temp_storge_array  = []
        possible_move               = Node.new(child_location)
        possible_move.location      = run_count
        possible_move.parent        = tree_array[index_adding].value
        knight.postion              = possible_move.value
        knight_posible_moves        = valid_move_check(knight.posible_moves)
        knight_posible_moves.each do |valid_move|
          children_temp_storge_array << valid_move
        end
        possible_move.children = children_temp_storge_array
        tree_array << possible_move
      end
    end
    location_array_for_next_run = this_run################################################
    this_run = []##########################################################################
    if tree_array.any? { |e| e.value == finish  }
      are_we_there_yet = true
    end
  end
  return tree_array
end
def find_path(tree_array,start,finish)
  the_path = []
  #find the locaton of the end node
  tree_array.each do |node|
    if node.value == finish
      puts "\n found the finish at #{node.value}"
      @parent = node.parent #prbbobly should have put the parent location in the array in the node...
      the_path << node.value
      the_path << node.parent
      break
    end
  end
  #hop to each parent untill at start
  are_we_there_yet = false
  until are_we_there_yet == true
    tree_array.each do |node|
      if node.value == @parent
        puts "\n found the parent at #{node.value}"
        @parent = node.parent #prbbobly should have put the parent location in the array in the node...
        the_path << node.parent
        break
      end
    end
    if @parent == start
      puts "\n found the start at  #{@parent}"
      are_we_there_yet = true
    end
  end
  return the_path.reverse
end

start  = [0,0]
finish = [7,7]
binary_tree = tree_array_creation(start,finish)
# then give visual of the array creation
binary_tree.each do |node|
  puts "Parent = #{node.parent} | Location = #{node.value} | Index = #{node.location} | possibile moves = #{node.children} "
end
#find the path the knight took
the_path = find_path(binary_tree,start,finish)
puts "\n Therfore the knights path is: #{the_path}"
