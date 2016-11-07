require 'socket'
require 'json'

puts "\n      ** INDEX BROWSER **    \n\n"

def request_type
  path     = ".\\index.html"   # the_file we want ... location can be http://www.whatever.com/the_file
  
  puts "to send a GET request (g)         to send a POST request (p)"
  request_is = gets.chomp
  if request_is == 'g'
    "GET #{path} HTTP/1.0\r\n\r\n" # This is the HTTP request we send to fetch a file
  elsif request_is == 'p'
    post_request
  else
    puts 'your input was not valid ... only g or p are valid inputs'
    request_type
  end
end

def post_request
  path     = ".\\index.html"   # the_file we want to post to ... location can be http://www.whatever.com/the_file
  puts 'you chose to post'
  puts 'what is your name?'
  name = gets.chomp
  puts 'what is your email?'
  email = gets.chomp
  hash  = {:viking => {:name=>name, :email=>email} }.to_json
  "POST #{path} HTTP/1.0 Content_Length:#{hash.length} #{hash}\r\n"
end
  
host     = 'localhost'     # host name or IP address
port     = 2000            # open port ... can be whatever
socket = TCPSocket.open(host,port)       # starts the socket... file transfer
request = request_type
socket.print(request)                    # Send request to server  (\n is needed or there will be a hang.. because of the way gets works...)
response = socket.read                   # Read complete response from server
print response

#STDERR.puts 

