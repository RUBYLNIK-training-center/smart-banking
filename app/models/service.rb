class Service < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  belongs_to :wallet, dependent: :nullify
  belongs_to :category, dependent: :nullify
end
