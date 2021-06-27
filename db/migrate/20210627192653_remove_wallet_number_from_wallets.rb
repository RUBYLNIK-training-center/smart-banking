class RemoveWalletNumberFromWallets < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :wallet_number
  end
end
