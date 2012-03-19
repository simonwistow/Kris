class Kris::Application < Sinatra::Base
  
  get "/user/:id" do |id|
    @title = "User information" 
    @name = id
    erb :user
  end
  
  post "/user" do
    # Choose a bucket
    # Create a user
    # Redirect to their page
  end
  
end