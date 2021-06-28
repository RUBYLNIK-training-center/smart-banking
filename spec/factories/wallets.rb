FactoryBot.define do
  factory :wallet do
    association :currency, factory: :currency
    amount { rand(1..100) }
    association :user, factory: :user
    locked { false }
    wallet_number { rand(1_111_111_111_111_111..9_999_999_999_999_999) }
  end
end
