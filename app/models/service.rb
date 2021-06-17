class Service < ApplicationRecord
  validates :name, presence: true

  belongs_to :wallet
  belongs_to :category
end
