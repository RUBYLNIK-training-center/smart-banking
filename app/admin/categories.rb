ActiveAdmin.register Category do
  form do |f|
    f.inputs do
      f.input :name
    end
    f.submit 'Create category', class: 'btn btn-primary'
  end

  permit_params :name, :locale

  member_action :create, method: :post do
    category = current_admin_user.categories.create(name: params[:category][:name])
    category.save
    redirect_to admin_category_path(category)
  end
end
