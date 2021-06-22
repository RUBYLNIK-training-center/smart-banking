class AdminUser < ApplicationRecord
  has_many :posts, dependent: :nullify

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
