# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

# Homepage
class TreeAndBHome < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = 'Hello Trees'
  end
end

# API
class TreeAndBAPI < Sinatra::Base
  get '/users/:id' do
    # Query if a user exists
    response = User.find_by(id: params[:id])
    return response.to_json
  end

  post '/users' do
    # Create a user
    User.create(
      id: params[:id],
      location: params[:location]
    )
  end

  delete '/users/:id' do
    # Delete a user
    user = User.find_by(id: params[:id])
    user.destroy
  end

  patch '/users/:id' do
    # Update likes/dislikes
    user = User.find_by(id: params[:id])
    user.location = params[:location]
    user.likes = params[:likes]
    user.dislikes = params[:dislikes]
    user.radius = params[:radius]
    user.save
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
      location: params[:location],
      user_id: params[:user_id]
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
