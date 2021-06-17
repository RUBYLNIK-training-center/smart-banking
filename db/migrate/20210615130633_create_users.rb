class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :email
      t.string :avatar
      t.string :phone_number
      t.string :passport_number

      t.timestamps
    end
  end
end
