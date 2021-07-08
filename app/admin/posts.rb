ActiveAdmin.register Post do
  actions :all, except: :create

  form do |f|
    f.inputs do
      f.file_field :avatar
      f.input :name
      f.input :description
    end
    f.submit 'Create post', class: 'btn btn-primary'
  end

  permit_params :name, :description

  member_action :create, method: :post do
    post = current_admin_user.posts.create(name: params[:post][:name], description: params[:post][:description],
                                           avatar: params[:post][:avatar])
    redirect_to admin_post_path(post)
  end
end
