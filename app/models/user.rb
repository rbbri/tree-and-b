# User model
class User < ActiveRecord::Base
  has_many :trees
  validates :id, presence: true, uniqueness: true
  validates :location, presence: true
end
