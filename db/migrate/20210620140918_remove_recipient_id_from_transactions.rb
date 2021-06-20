class RemoveRecipientIdFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :recipient_id, :string
  end
end
