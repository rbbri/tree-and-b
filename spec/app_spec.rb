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
      get '/api/v1/trees'
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


end

end
