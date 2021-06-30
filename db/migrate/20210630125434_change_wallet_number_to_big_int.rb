class ChangeWalletNumberToBigInt < ActiveRecord::Migration[6.1]
  def change
    change_column :wallets, :wallet_number, :bigint
  end
end
