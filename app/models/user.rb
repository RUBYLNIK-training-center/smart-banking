class User < ApplicationRecord
  include EmailValidatable

  validates :name, presence: true, length: { minimum: 2 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :email, uniqueness: true, confirmation: true, presence: true, confirmation: { case_sensitive: false }, 
  email: true # or devise reg_exp when devise will be added --- format: { with: Devise.email_regexp }

  validates :password, length: { in: 6..20 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_associated :wallets
  has_many :wallets, dependent: :nullify
end
