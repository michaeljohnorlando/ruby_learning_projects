#assuming the array will be numbers and by sorted they mean sequntial order
#assuming that duplicates are not wanted



class Node
    attr_accessor :value,:parent,:child_left,:child_right
    def initialize(value)
        @value        = value
        @parent       = nil
        @child_left   = nil
        @child_right  = nil
    end
end

def build_tree(arr_of_data)  # Sorts array then creates a node class for each data pice in the array
    arr_of_data = arr_of_data.uniq.sort
                                                                                 print arr_of_data
    tree_arr    = []
    parent_value          = 0
    row_iteration_count   = -1
    row_max_count         = 2 #start of multiply by 2 ... tree amount of nodes dubbles every row
    
    arr_of_data.each.with_index do |data,index|
        node             = Node.new(data)
        node.value       = data
        node.parent      = arr_of_data[parent_value] if index != 0 #root node will be nil
        node.child_left  = arr_of_data[index+1]
        node.child_right = arr_of_data[index+2]                           ############################## this is where I left off
        tree_arr << node
        row_iteration_count += 1
        next  if row_iteration_count < row_max_count
        parent_value  += 1
        row_max_count *= 2
    end
    print tree_arr
    puts"\n"
end

build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

    