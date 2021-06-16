class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.boolean :status
      t.string :transaction_type
      t.decimal :sum
      t.decimal :fee

      t.timestamps
    end
  end
end
