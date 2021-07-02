class RemoveIbanFromWallets < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :iban, :string
  end
end
