class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :currency, null: false, foreign_key: true
      t.string :name
      t.integer :amount
      t.integer :interval
      t.integer :trial_period_days
      t.string :statement_desc

      t.timestamps
    end
  end
end
