require 'rails_helper'

RSpec.describe Receipts::ReceiptGenerator do
  subject(:receipt_generator) { described_class.new(transaction) }

  let(:transaction) { build_stubbed(:transaction) }
  let(:expected_attributes) do
    {
      id: transaction.id,
      subheading: 'RECEIPT FOR TRANSACTION #%{id}',
      product: transaction.transaction_type,
      company: {
        name: 'Smartbanking, LLC.',
        address: "123 Fake Street\nMinsk, 220001",
        email: 'support@smartbanking-epam.ru'
      },
      line_items: [
        ['Date', transaction.created_at.to_s],
        ['Account Billed',
         "#{transaction.wallet.user.name} #{transaction.wallet.user.surname} (#{transaction.wallet.user.email})"],
        ['Product',        transaction.transaction_type],
        ['Amount',         "#{transaction.sum}0 #{transaction.wallet.currency.name}"],
        ['Charged to',     transaction.wallet.wallet_number.to_s],
        ['Sent to',        "**** **** **** #{transaction.wallet_reciepent.to_s.last(4)}"],
        ['Transaction ID', transaction.id]
      ]
    }
  end

  describe '#call' do
    it 'returns correct receipt attributes' do
      receipt_generator.call.attributes.each do |key, value|
        expect(value).to eq expected_attributes.fetch(key)
      end
    end
  end
end
