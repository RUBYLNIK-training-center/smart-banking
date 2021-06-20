class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_associated :wallets

  has_many :wallets
  has_many :subscriptions
end
