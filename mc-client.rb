require 'socket'      # Sockets are in standard library
require 'rubygems'
require 'highline/import'

def get_password(prompt="Enter Password")
   ask(prompt) {|q| q.echo = '*'}
end

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

print "Enter username : " 
username = STDIN.gets
#print "Enter passowrd : " 
password = get_password()
send = username + password
puts send
if username != "\n" && password != "\n"
   s.puts "#{username} \n"
   s.puts "#{password} \n"
   #s.puts "safir" + "\n"
   #s.puts "\n"
else
   puts "Aborting..."
   exit
end
#while line = s.gets   # Read lines from the socket
#  puts line.chop      # And print with platform line terminator
#end
str = s.recv( 100 )  
print str

#STDOUT.sync = true
#bars = ['/','-','\\','|']
#i=1
#while i do
#  print "\rrunning #{bars[i%4]}"
#  i += 1
#  sleep 1
#end
#trap("INT") {
#  print "\n\n"
#  exit
#}
s.close               # Close the socket when done
