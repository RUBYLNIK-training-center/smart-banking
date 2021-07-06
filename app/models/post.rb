class Post < ApplicationRecord
  include Avatar

  default_scope { order(created_at: :desc) }
  belongs_to :admin_user, class_name: 'AdminUser'
  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 2000 }
  validate :avatar_file_size, :avatar_file_format

  validates :avatar, content_type: ['image/png', 'image/jpeg', 'image/jpg']

  paginates_per 5
end
