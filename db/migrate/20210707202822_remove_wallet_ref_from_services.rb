class RemoveWalletRefFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:services, :wallet, foreign_key: true)
  end
end
