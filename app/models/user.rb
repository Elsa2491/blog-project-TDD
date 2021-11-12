class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts

  validates :first_name, presence: true
  validates :email, presence: true
end
