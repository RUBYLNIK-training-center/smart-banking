ActiveAdmin.register Service do
  before_create do |service|
    service.wallet.amount = 0
  end
  includes(:category, wallet: :currency)

  permit_params :name, :category_id, wallet_attributes: %i[currency_id id]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.input :name
    f.input :category
    f.inputs do
      f.has_many :wallet do |a|
        a.input :currency_id, label: 'Currency', as: :select, collection: WalletsHelpers.currencies.map { |el|
                                                                            [el.name, el.id]
                                                                          }
      end
    end
    f.submit 'Create service', class: 'btn btn-primary'
  end

  index do
    column :id
    column :name
    column :created_at
    column :updated_at
    column :category
    column :currency do |service|
      service.wallet.currency
    end
    column :wallet do |service|
      service.wallet.wallet_number
    end
    actions
  end
end
