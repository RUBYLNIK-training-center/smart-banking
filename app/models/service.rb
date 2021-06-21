class Service < ApplicationRecord
  belongs_to :wallet
  belongs_to :category

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
