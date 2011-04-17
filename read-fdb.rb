#!/usr/bin/ruby
class User
  @@id=""
  @@ip=""
  @@username=""
  @@password=""
  @@token=""
  @@date=""
  @@usermap={}
  def id=(id)
    @@id=id
  end

  def id
    @@id
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

  def token
    @@token
  end

  def get_id
     return @@id
  end 
  def date
    @@date
  end
  def username
    @@username
  end


  def get_users
     @@usermap
  end
  def set_users=(users)
     @@usermap=users
  end

  def read_file=(fname,u={})
       puts "here"
       usermap = {}
       users = Array.new
       infile = File.new("cdb.db", "r")
       #reads all the file contents line by line 
       #and populates linearray Array.
       linearray = infile.readlines
       i = 0
       #read line by line and split it by delimiter |
       #for each line check for the occurance of a certain string
  puts "jere"
       for line in linearray
       user =  User.new
       tokens = line.split('|')
       token_count = 0
           for token in tokens
              case token_count
                 when 0
                    user.id=(token)
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
      @@usermap=usermap
   end
end #class

puts "Starting..."
a = User.new
userm= Hash.new
fname="cdb.db"
a.read_file=(fname,userm={})
a.get_users.each do|name,grade|
  puts "#{name}: #{grade}"
  puts grade.get_id
end

puts "ending..."
exit
