class Blogpost < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :summary, presence: true
end
