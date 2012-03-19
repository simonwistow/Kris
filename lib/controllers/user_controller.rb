class Kris::Application < Sinatra::Base

  
  get "/user/:id" do |id|
    @user    = User.get(id)
    @title   = "Information for #{@user.name}" 
    @created = params["created"] 
    erb :user
  end
  
  get "/user/:id/instructions" do |id|
    @user    = User.get(id)
    @title  = "Instructions for #{@user.name}"
    erb :"instructions/#{@user.bucket}"
  end
  
  post "/user" do
    pp params
    
    # Create a user
    user = User.first_or_create(:email => params["email"], :name => params["name"])
    Kris::Email.send_email(:signup, user.email, :user => user, :url => "#{base_url}/user/#{user.id}")

    # Redirect to their page
    redirect "/user/#{user.id}?created=true"
  end
end