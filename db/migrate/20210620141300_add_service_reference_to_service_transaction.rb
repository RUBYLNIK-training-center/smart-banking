class AddServiceReferenceToServiceTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :service_transactions, :service, null: false, foreign_key: true
  end
end
