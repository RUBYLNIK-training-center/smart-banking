class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.references :currency, null: false, foreign_key: true
      t.decimal :amount
      t.string :iban
      t.integer :wallet_number

      t.timestamps
    end
  end
end
