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
    tree_arr    = []
    parent_value          = -1 # counting the first time through the each loop hotfix
    row_iteration_count   = 1
    row_max_count         = 1 #multiply by 2 ... tree amount of nodes dubbles every row
    
    print arr_of_data
    puts"\n"
    
    arr_of_data.each.with_index do |value,index|
        node             = Node.new(value)
        if  index == 0   #root node 
            node.child_left  = arr_of_data[1]
            node.child_right = arr_of_data[2]
            parent_value += 1
        else
            node.parent = arr_of_data[parent_value]
            if row_iteration_count == 1
                node.child_left = arr_of_data[index + row_max_count]
                node.child_right = arr_of_data[index + row_max_count + 1]
            else
                node.child_left = arr_of_data[index + row_max_count  + 1]
                node.child_right = arr_of_data[index + row_max_count + 2]
            end
        end
        puts "value = #{node.value} parent = #{node.parent} child_left = #{node.child_left} child_right = #{node.child_right}"
        tree_arr << node
        
        parent_value += 1 if row_iteration_count % 2 == 0
        row_iteration_count  += 1
        
        next  if row_iteration_count <= row_max_count
        puts "next row now"
        row_iteration_count = 1 # new row count begins 
        row_max_count *= 2
    end
    print tree_arr
    puts"\n"
end

build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])