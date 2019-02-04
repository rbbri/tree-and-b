# User model
class User < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :location, presence: true
end
