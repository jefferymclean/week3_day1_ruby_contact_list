require "sinatra"
require "sinatra/activerecord"
require_relative "contact"

set :database, "sqlite3:///db.sqlite"

helpers do
  # If @title is assigned, add it to the page's title.
  def contact_show_page?
    request.path_info =~ /\/contacts\/\d+$/
	end

	def delete_contact_button(contact_id)
		erb :_delete_contact_button, locals: { contact_id: contact_id }
	end

  def title
    if @title
      "#{@title} -- My Contact List"
    else
      "My Contact List"
    end
  end
 
  # Format the Ruby Time object returned from a contact's created_at method
  # into a string that looks like this: 06 Jan 2012
  def pretty_date(time)
   time.strftime("%d %b %Y")
  end
 
end

# Get all of our routes
get "/" do
  @contacts = Contact.all
  erb :"contacts/index"
end
 
# Get the New contact form
get "/contacts/new" do
  @title = "New Contact"
  @contact = Contact.new
  erb :"contacts/new"
end
 
# The New contact form sends a contact request (storing data) here
# where we try to create the contact it sent in its params hash.
# If successful, redirect to that contact. Otherwise, render the "contacts/new"
# template where the @contact object will have the incomplete data that the 
# user can modify and resubmit.
post "/contacts" do
  @contact = Contact.new(params[:contact])
  if @contact.save
    redirect "contacts/#{@contact.id}"
  else
    erb :"contacts/new"
  end
end
 
# Get the individual page of the contact with this ID.
get "/contacts/:id" do
  @contact = Contact.find(params[:id])
  @name = @contact.name
  erb :"contacts/show"
end
 
# Get the Edit contact form of the contact with this ID.
get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id])
  @title = "Edit Form"
  erb :"contacts/edit"
end
 
# The Edit contact form sends a PUT request (modifying data) here.
# If the contact is updated successfully, redirect to it. Otherwise,
# render the edit form again with the failed @contact object still in memory
# so they can retry.
put "/contacts/:id" do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:contact])
    redirect "/contacts/#{@contact.id}"
  else
    erb :"contacts/edit"
  end
end
 
# Deletes the contact with this ID and redirects to homepage.
delete "/contacts/:id" do
  @contact = Contact.find(params[:id]).destroy
  redirect "/"
end
 
# Our About Me page.
get "/about" do
  @contacts = "About Me"
  erb :"pages/about"
end