# frozen_string_literal: true

# User model
class User < ActiveRecord::Base
  has_many :trees
  validates :location, presence: true
end
