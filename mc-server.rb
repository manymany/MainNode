# multiple client tcp server
require 'socket'                # Get sockets from stdlib
#require 'read-fdb.rb'
require 'user.rb'
require 'fill-users.rb'

def generate_token()
   o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;  
   token =  (0..50).map{ o[rand(o.length)]  }.join;
   return token
end

puts "Loading users..."
fname="cdb.db"
#u = User.new
#u.read_file=(fname,users={})
#u.get_users.each do|id,user|
#  puts "#{id}: #{user}"
#  puts user.get_id
#end

users = Hash.new
users = read_file(fname,m={})
puts "Done loading..."
server = TCPServer.open(2000)   # Socket to listen on port 2000
#loop {                          # Servers run forever
#  Thread.start((session=server.accept)) do |client|
#    client.puts(Time.now.ctime) # Send the time to the client
#	client.puts "Closing the connection. Bye!"
#    puts session.gets
#    client.close                # Disconnect from the client
#  end
#} comment
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
   username = session.gets
   password = session.gets
   if username != nil && password != nil 
      username[username.length-1,1]=""
      u = users[username]
     if u.get_id == username
         token = generate_token
         puts "found in map"
         session.puts "#{token}\n"
      end
      ## Lets respond with a nice warm welcome message
      #session.puts "Server: Welcome #{session.peeraddr[2]} with #{token}\n"
   else
      token = ""
      # reply with goodbye
      ## now lets end the session since all we wanted to do is
      ## acknowledge the client
      puts "log: sending Goodbye"
      session.puts "Server: Goodbye\n"
   end
 end  #end thread conversation
end   #end loop


