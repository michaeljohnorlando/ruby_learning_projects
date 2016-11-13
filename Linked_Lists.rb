# random thoughts... @head == nil || @head.nil?      what looks better?

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(node_name,data = nil) #creates a new node at the end of the list... data in node is nil by default
	node_name           = Node.new                              #creates a new node
    node_name.value     = data                                  #inserts the data into the node
    node_name.next_node = nil                                   #gives the node info on what the next node will be
    @tail.nil? ? @tail = node_name : @tail.next_node = node_name #changes the old tail next_node to reference what the new tail will be... or if no tail makes one
    @tail               = node_name                             #since this data is the new tail it assigns the @tail with this value
    @head = node_name if @head.nil?                             #if the list is empty then this value also needs to set the head value
  end
  def prepend(node_name,data = nil) #creates a new node at the start of the list... same as append just at the beginning
	node_name           = Node.new
    node_name.value     = data
    node_name.next_node = @head
    @head               = node_name
    @tail = node_name if @head.nil?
  end
  def size #returns the size as an integer
	total = 0 # the counter
    if @head.nil?
        return 0
    else
	  node = @head
	  until node.nil?
		node =  node.next_node
		total += 1
	  end
	  return total
    end
  end
  def head # returns head value
    return nil if @head.nil?
    @head.value
  end
  def tail # returns tail value
    return nil if @tail.nil?
    @tail.value
  end
  def at(index)
end

class Node # makes a new entry 
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @data      = value
    @next_node = next_node
  end
end
test = LinkedList.new
test.append(2,'two')
test.prepend(1,'one')
test.prepend(0,'zero')
test.append(3,'three')
#puts test.head   <<= zero
#puts test.tail   <<= three   
#puts test.size   <<= 4