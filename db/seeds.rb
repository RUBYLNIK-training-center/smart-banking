AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Currency.create(name: 'UAH', rate: 27.36)
Currency.create(name: 'RUB', rate: 72.21)
Currency.create(name: 'BYN', rate: 2.53)