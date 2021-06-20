class AddLockedToWallet < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :locked, :boolean
  end
end
