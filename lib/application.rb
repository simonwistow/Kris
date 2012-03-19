require 'extensions/array'
require 'extensions/hash'

require 'util/email'

require 'models/user'

require 'controllers/user_controller'
require 'controllers/signup_controller'

DataMapper.finalize
User.auto_upgrade!

class Kris::Application < Sinatra::Base
  set :static, true
  set :views, Kris::ROOT + '/views'
  @title = "Kris"
  
  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end
  end
end

