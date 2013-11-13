class Application
 
  def initialize
    # Start with an empty array of contacts.
      
    @contacts = [Contact.new("Jeff McLean", "jeffery.mclean@gmail.com")]
                  # ^ this is the instance of the class (saved in an array)
  end
 
  def run
    loop do
      show_main_menuqu
      input = gets.chomp
      break if input == "quit"
      if input == "new"
        puts "Please enter your first and last names."
        input_name = gets.chomp
        if input_name.length > 0
          puts "Please enter your email address."
          input_email = gets.chomp
          puts @contacts 
          new_contact = Contact.new(input_name, input_email)
          @contacts << new_contact
        end

      elsif input == "list"
        @contacts.each_with_index do |input_name, input_email| 
          puts "#{input_name}: #{input_email}" 
        end
      end
    end 
  end  

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to your app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    print "> "
  end
end
