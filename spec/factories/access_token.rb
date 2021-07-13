class AccessToken
  attr_reader :email, :name, :surname

  def initialize(email, name, surname)
    @email = email
    @name = name
    @surname = surname
  end

  def info
    { 'email' => @email, 'name' => @name, 'surname' => @surname }
  end
end
