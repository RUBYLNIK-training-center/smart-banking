class Post < ApplicationRecord
  paginates_per 5
  belongs_to :admin_user, class_name: 'AdminUser'

  validates :name, presence: true, length: { minimum: 2 }
  default_scope { order(created_at: :desc) }
end
