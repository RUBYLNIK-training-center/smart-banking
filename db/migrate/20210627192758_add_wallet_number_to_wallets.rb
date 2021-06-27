class AddWalletNumberToWallets < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :wallet_number, :bigint
  end
end
