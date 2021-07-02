FactoryBot.define do
  factory :currency do
    name { Faker::Currency.code }
    rate { rand(1..10) }
  end
end
