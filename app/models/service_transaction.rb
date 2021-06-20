class ServiceTransaction < ApplicationRecord
  belongs_to :service_reciepent_id, dependent: :destroy
  belongs_to :transaction_id, dependent: :destroy
end
