ActiveAdmin.register User do
  actions :all, except: %i[new create update destroy edit]

  batch_action :lock, priority: 1 do |ids|
    batch_action_collection.where(id: ids).find_each(&:lock!)

    redirect_to collection_path, notice: 'The users have been locked.'
  end

  batch_action :unlock do |ids|
    batch_action_collection.where(id: ids).find_each(&:unlock!)

    redirect_to collection_path, notice: 'The users have been unlocked.'
  end

  index do
    selectable_column
    id_column

    column :name
    column :surname
    column :age
    column :email
    column :phone_number
    column :passport_number
    column :locked
    column :created_at

    actions do |user|
      text = user.locked? ? 'Unlock' : 'Lock'
      item text, lock_admin_user_path(user), method: :put, class: 'member_link'
    end
  end

  filter :name
  filter :surname
  filter :age
  filter :email
  filter :phone_number
  filter :passport_number
  filter :created_at

  member_action :lock, method: :put do
    if resource.locked?
      resource.unlock!
      action = 'Unlocked!'
    else
      resource.lock!
      action = 'Locked!'
    end

    redirect_to resource_path, notice: action
  end

  action_item :lock, only: :show do
    text = resource.locked? ? 'Unlock' : 'Lock'
    link_to text, lock_admin_user_path, method: :put
  end
end
