class Application
 
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
          # creating an instance of the class Contact (below) w/these attr's
          new_contact = Contact.create({name: input_name, email: input_email})
        end  
      end

      if input.include?("delete")
        #input_array is a var i created! and assigned the value of input.split to it
        id = input.split[1] 
        contact = Contact.find(id)
        contact.destroy
        puts "Contact deleted (that was mean!)"   

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