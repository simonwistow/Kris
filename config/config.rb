require 'rubygems' if RUBY_VERSION < "1.9"
require 'bundler/setup'

require 'data_mapper'
require 'dm-types'
require 'erb'
require 'json'
require 'logger'
require 'sinatra'

module Kris
  ROOT      = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  ENV_NAME  = ENV['KRIS_ENV'] || 'development'
  LOGGER    = Logger.new(STDERR)
  
  # Load vendored libraries
  $: << File.join(ROOT, 'vendor', 'lib')
  
  CONFIG = YAML.load_file(File.join(ROOT, 'config', 'config.yml'))[ENV_NAME]
  
  def self.setup
    $: << File.join(ROOT, 'lib')
    LOGGER.level = ENV_NAME == 'development' ? Logger::DEBUG : Logger::INFO
    
    DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/kris.db")
    
    require 'application'
  end
  
end

Kris.setup