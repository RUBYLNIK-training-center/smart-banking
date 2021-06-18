class AdminUser < ApplicationRecord
  has_many :news, dependent: :nullify
end
