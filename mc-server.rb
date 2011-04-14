# multiple client tcp server
require 'socket'                # Get sockets from stdlib

server = TCPServer.open(2000)   # Socket to listen on port 2000
#loop {                          # Servers run forever
#  Thread.start((session=server.accept)) do |client|
#    client.puts(Time.now.ctime) # Send the time to the client
#	client.puts "Closing the connection. Bye!"
#    puts session.gets
#    client.close                # Disconnect from the client
#  end
#}
puts "Server Started"
while (session = server.accept)
 #start new thread conversation
 ## Here we will establish a new thread for a connection client
 Thread.start do
   ## I want to be sure to output something on the server side
   ## to show that there has been a connection
   puts "log: Connection from #{session.peeraddr[2]} at
          #{session.peeraddr[3]}"
   puts "log: got input from client"
   ## lets see what the client has to say by grabbing the input
   ## then display it. Please note that the session.gets will look
   ## for an end of line character "\n" before moving forward.
   input = session.gets
   puts input
   ## Lets respond with a nice warm welcome message
   session.puts "Server: Welcome #{session.peeraddr[2]}\n"
   # reply with goodbye
   ## now lets end the session since all we wanted to do is
   ## acknowledge the client
   puts "log: sending Goodbye"
   session.puts "Server: Goodbye\n"
 end  #end thread conversation
end   #end loop
