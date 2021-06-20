class Service < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  belongs_to :wallet
  belongs_to :category
end
