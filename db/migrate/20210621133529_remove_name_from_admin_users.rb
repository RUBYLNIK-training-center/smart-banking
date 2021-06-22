class RemoveNameFromAdminUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :admin_users, :name
  end
end
