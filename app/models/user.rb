class User < ApplicationRecord
  include Avatar

  has_many :subscriptions, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, allow_nil: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :avatar_file_size, :avatar_file_format

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first_or_create do |u|
      u.name = data['first_name']
      u.surname = data['last_name']
      u.password = Devise.friendly_token[0, 20]
    end
  end

  def lock!
    update(locked: true)
  end

  def unlock!
    update(locked: false)
  end
end
