class AdminUser < ApplicationRecord
  validates :name, presence: true
  validates_associated :posts

  has_many :posts
end
