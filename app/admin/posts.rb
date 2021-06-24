ActiveAdmin.register Post do
  form do |f|
    f.label "Author id is #{current_admin_user.id}", class: 'label'
    f.inputs do
      f.input :name
      f.input :description
    end
    f.submit "Create post", class: "btn btn-primary"
  end

  member_action :create, method: :post do
    post = Post.new(name: params[:post][:name], description: params[:post][:description])
    post.admin_user_id = current_admin_user.id
    post.save
    redirect_to admin_post_path(post)
  end
end
