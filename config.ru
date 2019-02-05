require './app.rb'
  run Treeandb_Home
map '/api/v1' do
  run Treeandb_API
end
