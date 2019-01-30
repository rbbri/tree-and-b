require './app.rb'

describe Treeandb do
  it 'allows access to the homepage' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello World 2')
  end

end
