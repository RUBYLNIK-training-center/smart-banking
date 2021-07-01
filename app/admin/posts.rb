ActiveAdmin.register Post do
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
    post = current_admin_user.posts.new(name: params[:post][:name], description: params[:post][:description],
                                        avatar: params[:post][:avatar])
    post.save
    redirect_to admin_post_path(post)
  end
end
