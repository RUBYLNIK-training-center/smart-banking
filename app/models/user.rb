class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, allow_nil: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :acceptable_avatar

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

  def acceptable_avatar
    return unless avatar.attached?
  
    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
