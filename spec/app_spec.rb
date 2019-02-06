# frozen_string_literal: true

require './app.rb'

describe TreeAndBHome do
  it 'allows access to the homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello Trees')
    expect(last_response.status).to eq(200)
  end
end

describe TreeAndBAPI do
  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  before do
    create(:user)
    create(:tree)
  end

  describe 'Routes' do
    it 'has a route for getting a user' do
      get '/users/1'
      expect(last_response).to be_ok
    end
    it 'has a route for creating a user' do
      post '/users'
      expect(last_response).to be_ok
    end
    it 'has a route for deleting a user' do
      delete '/users/1'
      expect(last_response).to be_ok
    end
    it 'has a route for updating likes/dislikes' do
      patch '/users/1'
      expect(last_response).to be_ok
    end
    it 'has a route for getting all trees' do
      get '/trees'
      expect(last_response).to be_ok
    end
    it 'has a route for getting an individual tree' do
      get '/trees/1'
      expect(last_response).to be_ok
    end
    it 'has a route for creating a tree' do
      post '/trees'
      expect(last_response).to be_ok
    end
    it 'has a route for updating a tree' do
      patch '/trees/1'
      expect(last_response).to be_ok
    end
    it 'has a route for deleting a tree' do
      delete '/trees/1'
      expect(last_response).to be_ok
    end
  end

  describe 'Responses' do
    describe 'Tree endpoints' do
      it 'get /trees returns all trees' do
        create(:tree, id: '2')
        get '/trees'
        expect(response).to eq(
          [{
            id: 1,
            name: 'test_tree',
            description: 'an_example_description',
            imageURL: 'https://goo.gl/cLZHjA',
            location: 'there'
          },
           {
             id: 2,
             name: 'test_tree',
             description: 'an_example_description',
             imageURL: 'https://goo.gl/cLZHjA',
             location: 'there'
           }]
        )
      end
      it 'get /trees/:id returns an individual tree' do
        get '/trees/1'
        expect(response).to eq(
          id: 1,
          name: 'test_tree',
          description: 'an_example_description',
          imageURL: 'https://goo.gl/cLZHjA',
          location: 'there'
        )
      end
      it 'post /trees creates a tree' do
        post '/trees',
             id: 3,
             name: 'test_tree',
             description: 'an_example_description',
             imageURL: 'https://goo.gl/cLZHjA',
             location: 'there'
        get '/trees/3'
        expect(response).to eq(
          id: 3,
          name: 'test_tree',
          description: 'an_example_description',
          imageURL: 'https://goo.gl/cLZHjA',
          location: 'there'
        )
      end
      it 'patch /trees/:id updates a tree' do
        patch '/trees/1',
              id: 1,
              name: 'test_tree 2',
              description: 'a_different_description',
              imageURL: 'https://goo.gl/cLZHjB',
              location: 'not there'
        get '/trees/1'
        expect(response).to eq(
          id: 1,
          name: 'test_tree 2',
          description: 'a_different_description',
          imageURL: 'https://goo.gl/cLZHjB',
          location: 'not there'
        )
      end
      it 'delete /trees/:id deletes a tree' do
        create(:tree, id: '2')
        delete '/trees/2'
        expect(last_response).to be_ok
      end
    end
    describe 'User endpoints' do
      it 'get /users/:id returns an individual user' do
        get '/users/1'
        expect(response).to eq(
          id: 1,
          location: 'Here',
          likes: [],
          dislikes: [],
          radius: nil
        )
      end
      it 'post /users creates a user' do
        post '/users',
             id: 2,
             location: 'Here',
             likes: [],
             dislikes: [],
             radius: nil
        get '/users/2'
        expect(response).to eq(
          id: 2,
          location: 'Here',
          likes: [],
          dislikes: [],
          radius: nil
        )
      end
      it 'delete /users/:id deletes a user' do
        create(:user, id: '3')
        delete '/users/3'
        expect(last_response).to be_ok
      end
      it 'patch /users/:id updates a user' do
        patch '/users/1',
              location: 'new location',
              likes: [1],
              dislikes: [2],
              radius: 1
        get '/users/1'
        expect(response).to eq(
          id: 1,
          location: 'new location',
          likes: [1],
          dislikes: [2],
          radius: 1
        )
      end
    end
  end
end
