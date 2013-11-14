class Application
 
  def initialize
    # Start with an empty array of contacts.
      

      # this line is the instance of the class (saved in an array)
      # uneeded now b/c these contacts will be stored on disk in db files now.
      # more specif = they'll be stoed in contacts table we already created.
  #  @contacts = Contact.new("Jeff McLean", "jeffery.mclean@gmail.com")             
  end
 
  def run
    loop do
      show_main_menu
      input = gets.chomp
      break if input == "quit"
      if input == "new"
        puts "Please enter your first and last names."
        input_name = gets.chomp
        if input_name.length > 0
          puts "Please enter your email address."
          input_email = gets.chomp
          #puts @contacts 
          #new_contact = Contact.new(name: input_name, email: input_email)
          #this line below does what contact.new + new_contact.save 
          new_contact = Contact.create({name: input_name, email: input_email})
          #new_contact.save
        end
      end


      if input.include?("delete")
        #input_array is a var i created! and assigned the value of input.split to it
        input_array = input.split(' ') 
        id = input_array[1] 
          contact = Contact.find(id)
          contact.destroy
          puts "hello"   

        elsif input == "list"
          Contact.all.each do |contact| 
            puts " #{contact.id}: #{contact.name}: #{contact.email}" 

        end
      end
    end 
  end  

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to your app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " delete :id - Delete a contact"
    puts " importance - Order contacts by importance"
    print "> "
  end
end
