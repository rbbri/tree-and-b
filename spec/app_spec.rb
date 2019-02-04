require './app.rb'

describe Treeandb do
  it 'allows access to the homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello Trees')
    expect(last_response.status).to eq(200)
  end

  describe 'Api' do
    before do
      create(:user)
      create(:tree)
    end

    describe 'Routes' do
      it 'has a route for getting a user' do
        get '/api/v1/users/1'
        expect(last_response).to be_ok
      end
      it 'has a route for creating a user' do
        post '/api/v1/users'
        expect(last_response).to be_ok
      end
      it 'has a route for deleting a user' do
        delete '/api/v1/users/1'
        expect(last_response).to be_ok
      end
      it 'has a route for updating likes/dislikes' do
        patch '/api/v1/users/1'
        expect(last_response).to be_ok
      end
      it 'has a route for getting all trees' do
        get '/api/v1/trees'
        expect(last_response).to be_ok
      end
      it 'has a route for getting an individual tree' do
        get '/api/v1/trees/1'
        expect(last_response).to be_ok
      end
      it 'has a route for creating a tree' do
        post '/api/v1/trees'
        expect(last_response).to be_ok
      end
      it 'has a route for updating a tree' do
        patch '/api/v1/trees/1'
        expect(last_response).to be_ok
      end
      it 'has a route for deleting a tree' do
        delete '/api/v1/trees/1'
        expect(last_response).to be_ok
      end
    end

    describe 'Responses' do
      describe 'Trees' do
        it 'returns all trees' do
          create(:tree, id: '2')
          get '/api/v1/trees'
          expect(JSON.parse(last_response.body, symbolize_names: true)).to eq
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
        end
        it 'returns an individual tree' do
          get '/api/v1/trees/1'
          expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(
            id: 1,
            name: 'test_tree',
            description: 'an_example_description',
            imageURL: 'https://goo.gl/cLZHjA',
            location: 'there'
          )
        end
        it 'creates a tree' do
          post '/api/v1/trees',
               id: 3,
               name: 'test_tree',
               description: 'an_example_description',
               imageURL: 'https://goo.gl/cLZHjA',
               location: 'there'
          get '/api/v1/trees/3'
          expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(
            id: 3,
            name: 'test_tree',
            description: 'an_example_description',
            imageURL: 'https://goo.gl/cLZHjA',
            location: 'there'
          )
        end
        it 'updates a tree' do
          patch '/api/v1/trees/1',
                id: 1,
                name: 'test_tree',
                description: 'a_different_description',
                imageURL: 'https://goo.gl/cLZHjA',
                location: 'there'
          get '/api/v1/trees/1'
          expect(JSON.parse(last_response.body, symbolize_names: true)).to eq(
            id: 1,
            name: 'test_tree',
            description: 'a_different_description',
            imageURL: 'https://goo.gl/cLZHjA',
            location: 'there'
          )
        end
        it 'deletes a tree' do
          create(:tree, id: '2')
          delete '/api/v1/trees/2'
          expect(last_response).to be_ok
        end
      end
    end
  end
end
