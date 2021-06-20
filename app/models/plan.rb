class Plan < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :interval, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :trial_period_days, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :statement_desc, length: { minimum: 20, maximum: 500 }

  belongs_to :currency
end
