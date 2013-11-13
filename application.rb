class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = ["Rich" "Jeff" "Sean" "Jessica" "Colin"]
  end
 
  def run
    loop do
      show_main_menu
      input = gets.chomp
      break if input == "quit"
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


# if input = "quit"
#      abort("Message goes here")
#     else 
#      return 