class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :wallets, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  validates_associated :wallets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    user || User.create(name: data['first_name'],
                        surname: data['last_name'],
                        email: data['email'],
                        password: Devise.friendly_token[0, 20])
  end

  def lock!
    update(locked: true)
  end

  def unlock!
    update(locked: false)
  end
end
