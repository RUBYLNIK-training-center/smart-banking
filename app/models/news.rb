class News < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  belongs_to :admin_user
end
