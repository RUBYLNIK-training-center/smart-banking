class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :service, optional: true

  validates :date, presence: true, date: true

  default_scope { order(created_at: :desc) }

  paginates_per 2

  def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "RECEIPT FOR TRANSACTION #%{id}",
      product: transaction_type,
      company: {
        name: "Smartbanking, LLC.",
        address: "123 Fake Street\nMinsk, 220001",
        email: "support@smartbanking-epam.ru",
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{wallet.user.name} #{wallet.user.surname} (#{wallet.user.email})"],
        ["Product",        transaction_type],
        ["Amount",         "#{sum}0 #{wallet.currency.name}"],
        ["Charged to",     "#{wallet.wallet_number}"],
        ["Sent to",        "**** **** **** #{wallet_reciepent.to_s.last(4)}"],
        ["Transaction ID", id]
      ],
    )
  end
end
