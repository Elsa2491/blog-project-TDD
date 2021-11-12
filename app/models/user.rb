class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
end
