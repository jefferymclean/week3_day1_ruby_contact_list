class Contact
  
  attr_accessor :name
  attr_accessor :email
  
  def initialize(input_name, input_email)
  	# assign local variables to instance variables
  	@input_name = input_name
  	@input_email = input_email
  end

  def input_name 
  		"#{@input_name}"
  end

    def input_email 
  		"#{@input_email}"
  end

  
  def to_s
    # return string representation of Contact
    "#{input_name} (#{input_email})"
  end
  
end