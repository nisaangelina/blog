class User < ApplicationRecord
  has_many :blogposts
  validates :name, presence: true
end
