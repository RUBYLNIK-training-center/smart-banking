class AddSenderIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :sender_id, :integer
    add_column :transactions, :recipient_id, :integer
  end
end
