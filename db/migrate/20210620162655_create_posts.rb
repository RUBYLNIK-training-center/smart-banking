class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
