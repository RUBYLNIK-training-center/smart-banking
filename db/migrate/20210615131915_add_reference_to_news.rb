class AddReferenceToNews < ActiveRecord::Migration[6.1]
  def change
    add_reference :news, :admin_user, null: false, foreign_key: true
  end
end
