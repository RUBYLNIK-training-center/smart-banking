FactoryBot.define do
  factory :transaction do
    association :currency, factory: :currency

    status { true }
    transaction_type { 'Banking' }
    sum { 10 }
    fee { 0.99 }
    sender_id { 1 }
    user_id { 2 }
    wallet_id { 2 }
    date { Time.now.to_f }
    wallet_reciepent { rand(1_111_111_111_111_111..9_999_999_999_999_999) }
  end
end
