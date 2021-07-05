class AddReciepentWalletIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :wallet_reciepent, :bigint
  end
end
