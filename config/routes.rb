Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { 
    registrations: 'users/registrations', 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  resources :users
  
  ActiveAdmin.routes(self)
  
  get 'home/index'
  get '/about', to: 'home#about'
  root 'home#index'
 	resources :post, only: :show
end
