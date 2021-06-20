class Subscription < ApplicationRecord
  validates :user_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  belongs_to :user
end
