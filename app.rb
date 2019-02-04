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
      response = Tree.all
      return response.to_json
    end

    get '/trees/:id' do
      # Get a individual tree
      response = Tree.find_by(id: params[:id])
      return response.to_json
    end

    post '/trees' do
      # Create a tree
      Tree.create(
        id: params[:id],
        name: params[:name],
        description: params[:description],
        imageURL: params[:imageURL],
        location: params[:location]
      )
    end

    patch '/trees/:id' do
      # Update tree info
      tree = Tree.find_by(id: params[:id])
      tree.name = params[:name]
      tree.description = params[:description]
      tree.imageURL = params[:imageURL]
      tree.location = params[:location]
      tree.save
    end

    delete '/trees/:id' do
      # Remove a tree (needs to be removed from user likes)
      tree = Tree.find_by(id: params[:id])
      tree.destroy
    end
  end
end
