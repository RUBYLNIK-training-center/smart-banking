class RemoveNullConstranintFromUsersInWallets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :wallets, :user_id, true
  end
end
