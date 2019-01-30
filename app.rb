require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

# Main application
class Treeandb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = 'Hello World 2'
  end
end
