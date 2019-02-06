# frozen_string_literal: true

require './app.rb'

run TreeAndBHome

map '/api/v1' do
  run TreeAndBAPI
end
