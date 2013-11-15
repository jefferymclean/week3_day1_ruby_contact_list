class Contact < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { minimum: 3 }



  # initialize $ attr_accessor are not needed
  # b/c AR takes care of it for us now 
  # attr_accessor :name
  # attr_accessor :email

  # #def initialize(input_name, input_email)
  # 	# assign local variables to instance variables

  # 	@input_name = input_name
  # 	@input_email = input_email
  # end

  #contact = Contact.create(name: "David", email: "david@gmail.com")

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