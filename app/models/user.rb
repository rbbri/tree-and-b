# User model
class User < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :location, presence: true
end
