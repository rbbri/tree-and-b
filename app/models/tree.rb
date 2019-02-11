# Tree model
class Tree < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :imageURL, presence: true
  validates :location, presence: true
end
