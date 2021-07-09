class Service < ApplicationRecord
  has_one :wallet, dependent: :destroy
  belongs_to :category

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  accepts_nested_attributes_for :wallet
end
