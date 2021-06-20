class ServiceTransaction < ApplicationRecord
  belongs_to :service_reciepent_id, optional: true
  belongs_to :transaction_id, optional: true
end
