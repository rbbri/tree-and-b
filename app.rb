require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

enable :sessions

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

# Main application
class Treeandb < Sinatra::Base
  get '/' do
    @title = 'Hello World'
  end
end
