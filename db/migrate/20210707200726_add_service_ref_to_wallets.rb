class AddServiceRefToWallets < ActiveRecord::Migration[6.1]
  def change
    add_reference :wallets, :service, foreign_key: true
  end
end
