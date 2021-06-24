class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :admin_user, class_name: 'AdminUser'

  validates :name, presence: true, length: { minimum: 2 }
  paginates_per 5
end
