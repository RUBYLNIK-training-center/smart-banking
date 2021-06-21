class Post < ApplicationRecord
  belongs_to :admin_user, class_name: 'AdminUser'

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
end
