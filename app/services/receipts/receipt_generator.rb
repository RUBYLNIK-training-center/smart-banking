module Receipts
  class ReceiptGenerator
    def initialize(transaction)
      @transaction = transaction
    end

    def call
      Receipts::Receipt.new(
        id: id,
        subheading: 'RECEIPT FOR TRANSACTION #%{id}',
        product: transaction_type,
        company: {
          name: 'Smartbanking, LLC.',
          address: "123 Fake Street\nMinsk, 220001",
          email: 'support@smartbanking-epam.ru'
        },
        line_items: [
          ['Date',           created_at.to_s],
          ['Account Billed', "#{wallet.user.name} #{wallet.user.surname} (#{wallet.user.email})"],
          ['Product',        transaction_type],
          ['Amount',         "#{sum}0 #{wallet.currency.name}"],
          ['Charged to',     wallet.wallet_number.to_s],
          ['Sent to',        "**** **** **** #{wallet_reciepent.to_s.last(4)}"],
          ['Transaction ID', id]
        ]
      )
    end

    private

    attr_reader :transaction

    delegate :id, :transaction_type, :sum, :wallet_reciepent, :wallet, :created_at, to: :transaction
  end
end
