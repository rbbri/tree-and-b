require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/namespace'

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

# Main application
class Treeandb < Sinatra::Base
  register Sinatra::Namespace
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = 'Hello Trees'
  end

  namespace '/api/v1' do

    get '/users/:id' do
      # Query if a user exists
    end

    post '/users' do
      # Create a user
    end

    delete '/users/:id' do
      # Delete a user
    end

    patch '/users/:id' do
      # Update likes/dislikes
    end

    get '/trees' do
      # Get all trees
    end

    get '/trees/:id' do
      # Get a individual tree
    end

    post '/trees' do
      # Create a tree
    end

    patch '/trees/:id' do
      # Update tree info
    end

    delete '/trees/:id' do
      # Remove a tree (needs to be removed from user likes)
    end

  end


end
