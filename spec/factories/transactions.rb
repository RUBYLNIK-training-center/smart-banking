FactoryBot.define do
  factory :transaction do
    user
    wallet
    status { true }
    transaction_type { 'Banking' }
    sum { 10 }
    fee { 0.99 }
    date { Time.current }
    wallet_reciepent { rand(1_111_111_111_111_111..9_999_999_999_999_999) }
  end
end
