# Tree model
class Tree < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  validates :imageURL, presence: true
  validates :location, presence: true
end
