class CreateServiceTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :service_transactions do |t|

      t.timestamps
    end
  end
end
