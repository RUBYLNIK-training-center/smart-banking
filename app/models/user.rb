class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  validates_associated :wallets

  has_many :wallets, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    user || User.create(name: data['first_name'],
                        surname: data['last_name'],
                        email: data['email'],
                        password: Devise.friendly_token[0, 20])
  end
end
