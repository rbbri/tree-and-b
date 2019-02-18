# frozen_string_literal: true

require './app/models/user.rb'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:location) }
  end

  describe 'Associations' do
    it 'has many trees' do
      association = User.reflect_on_association(:trees)
      expect(association.macro).to eq(:has_many)
    end
  end
end
