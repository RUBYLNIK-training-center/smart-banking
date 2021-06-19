class AdminUser < ApplicationRecord
  include EmailValidatable

  validates :name, presence: true
  validates :email, uniqueness: true, confirmation: true, presence: true, confirmation: { case_sensitive: false }, 
  email: true # or devise reg_exp when devise will be added --- format: { with: Devise.email_regexp }

  validates :password, length: { in: 6..20 }
  
  validates_associated :news
  has_many :news, dependent: :nullify
end
