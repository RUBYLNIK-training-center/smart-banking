class AddTransactionReferenceToServiceTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :service_transactions, :transaction, null: false, foreign_key: true
  end
end
