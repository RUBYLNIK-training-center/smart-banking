class AddPasswordToAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :password, :string
  end
end
