ActiveAdmin.register Post do
  actions :all, except: :create

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.submit 'Create post', class: 'btn btn-primary'
  end

  member_action :create, method: :post do
    post = current_admin_user.posts.new(name: params[:post][:name], description: params[:post][:description])
    post.save
    redirect_to admin_post_path(post)
  end
end
