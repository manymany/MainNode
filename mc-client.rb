require 'socket'      # Sockets are in standard library

if ARGV[0] != nil
   hostname = ARGV[0]
else
   hostname = 'localhost'
end
if ARGV[1] != nil
   port = ARGV[1]
else
   port = 2000
end

puts "Attempting to connect to server : #{hostname} using port : #{port}"

s = TCPSocket.open(hostname, port)

s.puts "hello i am so and so "+"\n"
#while line = s.gets   # Read lines from the socket
#  puts line.chop      # And print with platform line terminator
#end
str = s.recv( 100 )  
print str
s.close               # Close the socket when done
