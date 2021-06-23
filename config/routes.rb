Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { 
    registrations: 'users/registrations', 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  ActiveAdmin.routes(self)
  
  get 'home/index'
  root 'home#index'
 	resources :post, only: :show
end
