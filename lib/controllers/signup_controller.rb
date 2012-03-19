class Kris::Application < Sinatra::Base
  get "/" do
    erb :signup
  end

end