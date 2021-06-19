class Category < ApplicationRecord
  validates :name, presence: true

  validates_associated :services
  has_many :services, dependent: :nullify
end
