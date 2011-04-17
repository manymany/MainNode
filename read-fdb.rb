#!/usr/bin/ruby
class User
  @@id=""
  @@ip=""
  @@username=""
  @@password=""
  @@token=""
  @@date=""

  def id=(id)
    @@id=id
  end

  def ip=(ip)
    @@ip=ip
  end

  def username=(username)
    @@username=username
  end

  def password=(password)
    @@password=password
  end

  def date=(date)
    @@date=date
  end

  def token=(value)
    @@token = value
  end

  def get_id
     return @@id
  end 

  def read_file=(fname)
       usermap = {}
       users = Array.new
       infile = File.new("cdb.db", "r")
       #reads all the file contents line by line 
       #and populates linearray Array.
       linearray = infile.readlines
       i = 0
       #read line by line and split it by delimiter |
       #for each line check for the occurance of a certain string
       for line in linearray
       tokens = line.split('|')
       token_count = 0
           for token in tokens
              #TO DO:here populate the object and put it in an array 
              #
              user =  User.new
              case token_count
                 when 0
                    user.id=token
                 when 1
                    user.ip=token
                 when 2
                    user.username=token
                 when 3
                    user.password=token
                 when 4
                    user.token=token
                 when 5
                    user.date=token
                 else
                    puts "unknown token"
               end
             token_count = token_count + 1
           end # for tokesn
           users[i] = user
           i = i + 1
           usermap [user.get_id]=user
      end # for every line
      puts "There are  #{users.length} clients"
      return usermap
   end

end #class

#puts "Starting..."
#a = User.new
#a.read_file=("cdb.db")
#puts "ending..."
#exit
