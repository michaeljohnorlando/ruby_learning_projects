# random thoughts... @head == nil || @head.nil?      what looks better?

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value) #creates a new node at the end of the list
	node           = Node.new   #creates a new node
    node.value     = value      #inserts the data into the node
    node.next_node = nil        #gives the node info on what the next node will be
    @tail          = value      #since this data is the new tail it assigns the @tail with this value
    @head = value if @head.nil? #if the list is empty then this value also needs to set the head value
  end
  def prepend(value) #creates a new node at the start of the list... same as append just at the beginning
	node           = Node.new
    node.value     = value
    node.next_node = @head
    @head          = value
    @tail = value if @head.nil?
  end
  def size
    if @head.nil?
        return 0
    else
	  value = @head
	  until value.nil?
		value =  value.next_node
		total += 1
	  end
	  return total
    end
  end
  def head # retuns head value
    return nil if @head.nil?
    @head
  end
end

class Node # makes a new entry 
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @data      = value
    @next_node = next_node
  end
end


test = LinkedList.new
test.prepend('one')
test.append('two')
test.prepend('zero')
test.append('three')
puts test.head