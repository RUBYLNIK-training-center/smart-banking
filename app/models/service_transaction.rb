class ServiceTransaction < ApplicationRecord
  belongs_to :service_reciepent_id
  belongs_to :transaction_id
end
