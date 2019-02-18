# frozen_string_literal: true

require './app/models/tree.rb'

describe Tree, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:imageURL) }
    it { should validate_presence_of(:location) }
  end

  describe 'Associations' do
    it 'belongs to a user' do
      association = Tree.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
