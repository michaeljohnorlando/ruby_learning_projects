require 'socket'  ## SOCKET "a bouncing ball of packets between two endpoints" ##STDERR.puts 
require 'json'

def received_to_parts(client)
    recived = client.gets
    recived = recived.split # split up the socket into an array so parts are easily assessable  
    @request_type = recived[0]
    @file_path_requested = recived[1]
    @http_version = recived[2]
    if @request_type == 'POST'
        @Content_Length = recived[3]
        @post_data = recived[4]
    end
end

def file_send(client) #gets_the_file_and_sends_it_to_the_socket
    the_file = File.open(@file_path_requested,'r')
    the_file = the_file.read
    client.print the_file
end

def init_response(client)
    client.print(" #{@http_version} 200 OK \n #{Time.now} \n Content-Type: #{@file_path_requested} \n Content-Length: #{@file_path_requested.length} \n\n ")
end

def post_response(client)
    params = JSON.parse(@post_data)
    thanks_template = File.read(".\\thanks.html")
    thanks_new_content = ''
    params["viking"].each do |key, value|
        thanks_new_content << "<li>#{key}: #{value}</li>"
    end
    client.print (thanks_template.gsub("<%= yield %>", thanks_new_content))
end 


host     = 'localhost'      # host name or IP address
port     = 2000
server   = TCPServer.new(host,port)
loop {
    puts 'waiting on client...'
    client = server.accept
    #puts         "connected to client (port=#{port} Time=#{Time.now})"    #server prints connection notification
    #client.puts("connected to Server (port=#{port} Time=#{Time.now})\n")  #client prints connection notification
    received_to_parts(client)
    if @request_type == 'GET'
        init_response(client)
        file_send(client)
    elsif @request_type == 'POST'
        init_response(client)
        post_response(client)
    else
        client.print 'ERROR_CODE: 404 '
    end
    

    puts "closing connection"
    client.close
}