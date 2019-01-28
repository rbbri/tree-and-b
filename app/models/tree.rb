class Tree < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :imageURL, presence: true
  validates :location, presence: true
end
