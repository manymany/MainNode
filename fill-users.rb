require 'user.rb'
def read_file(fname,u={})
       usermap = {}
       users = Array.new
       infile = File.new(fname, "r")
       #reads all the file contents line by line 
       #and populates linearray Array.
       linearray = infile.readlines
       i = 0
       #read line by line and split it by delimiter |
       #for each line check for the occurance of a certain string
       for line in linearray
       user =  User.new
       puts line
       tokens = line.split('|')
       user.id=(tokens[0])
       user.ip=tokens[1]
       user.username=tokens[2]
       user.token=tokens[3]
       user.date=tokens[4]
       users[i] = user
       idx = user.get_id
       usermap [ idx ] = user
       if i == 5
          puts "when 5"
          puts usermap["1234"].username
       end
       i = i + 1
      end # for every line
      puts "There are  #{users.length} clients"
#      usermap.each do|key,value|
#          puts "#{key}: #{value}"
#          puts value.username
#      end
      return usermap
end
#fname="cdb.db"
#users = Hash.new
#users = read_file(fname,m={})
#users.each do|name,grade|
#  puts "#{name}: #{grade}"
#end
