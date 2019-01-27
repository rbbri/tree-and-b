require './app/models/user.rb'

describe User, type: :model do
 it { should validate_presence_of(:user_id) }
 it { should validate_uniqueness_of(:user_id) }
 it { should validate_presence_of(:location) }
end
