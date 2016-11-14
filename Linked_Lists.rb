# random thoughts...
#@head == nil || @head.nil?      what looks better?
#would make an each method for at index and size
#ooh shouldn't have been using value the whole time...

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
  def at(index) #returns the node at the given index
	node = @head
	return nil  if index > size || node.nil? || !index.is_a?(Integer)   # makes shure chosen index is valid
	return node if index == 0                                     #takes care of the first index because the loop always looks at the next node
	(index - 1).times do                                                      #runs through each node index times until hit
	    node =  node.next_node
    end
	return node
  end
  def pop #removes the last element from the list... (just stops refenceing it...new tail)
	@tail = at(size-1)
  end
  def contains?(value)#returns true if the passed in value is in the list and otherwise returns false
	size_of_list = size
	until size_of_list < 0
	  return true if at(size_of_list).value == value
	  size_of_list -= 1
	end
	return false
  end
  def find(data) #returns the index of the node containing data, or nil if not found
    return nil if !contains?(data) # if the data isnt present then nil
    size_of_list = size
	until size_of_list < 0  #checking each value --"right" to "left"
	  return size_of_list if at(size_of_list).value == data
	  size_of_list -= 1
	end
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
test.append(2,'two')
test.prepend(1,'one')
test.prepend(0,'zero')
test.append(3,'three')
#puts test.head               #<<= zero
#puts test.tail               #<<= three   
#puts test.size               #<<= 4
#puts test.at(0).value        #<<= zero
#puts test.at(3).value        #<<= three
#puts test.at(4).value        #<<= nil
#puts test.contains?('two')   #<<= true
#puts test.contains?('blah')  #<<= false
#puts test.find('two')        #<<= 3

#puts test.tail   #<<= three
#puts test.pop
#puts test.tail   #<<= two
