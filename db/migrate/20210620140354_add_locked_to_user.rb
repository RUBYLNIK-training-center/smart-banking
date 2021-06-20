class AddLockedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :locked, :boolean
  end
end
