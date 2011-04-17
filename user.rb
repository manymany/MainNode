#!/usr/bin/ruby
class User
  @id=""
  @ip=""
  @username=""
  @password=""
  @token=""
  @date=""

  def id=(id)
    @id=id
  end

  def id
    @id
  end

  def ip=(ip)
    @ip=ip
  end

  def username=(username)
    @username=username
  end

  def username
    @username
  end

  def password=(password)
    @password=password
  end
  def password
    @password
  end
  def date=(date)
    @date=date
  end

  def token=(value)
    @token = value
  end

  def token
    @token
  end

  def get_id
     return @id
  end 
  def date
    @date
  end

  def username
    @username
  end

end #class

