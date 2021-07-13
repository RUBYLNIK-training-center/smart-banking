class AddServiceReferenceToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :service, foreign_key: true
  end
end

