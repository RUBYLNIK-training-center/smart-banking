class AddFreezeToWallets < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :freeze, :boolean
  end
end
