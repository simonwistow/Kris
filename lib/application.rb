
require 'models/user'
require 'controllers/user_controller'
require 'controllers/signup_controller'

DataMapper.finalize
User.auto_upgrade!

class Kris::Application < Sinatra::Base
  set :static, true
  set :views, Kris::ROOT + '/views'
  @title = "Kris"
end