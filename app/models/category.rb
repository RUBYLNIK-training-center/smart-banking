class Category < ApplicationRecord
  validates :name, presence: true

  has_many :services
  validates_associated :services
end
