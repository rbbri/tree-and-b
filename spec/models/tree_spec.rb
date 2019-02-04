require './app/models/tree.rb'

describe Tree, type: :model do
  it { should validate_presence_of(:id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:imageURL) }
  it { should validate_presence_of(:location) }
end
