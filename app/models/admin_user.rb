class AdminUser < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, presence: true
  validates_associated :posts
end
