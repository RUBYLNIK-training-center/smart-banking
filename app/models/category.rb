class Category < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :name, presence: true

  validates_associated :services
end
