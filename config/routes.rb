Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    devise_for :users, controllers: { 
      registrations: 'users/registrations', 
      omniauth_callbacks: 'users/omniauth_callbacks' 
    }

    resources :users
  
    ActiveAdmin.routes(self)

    get 'home/index'
    get '/about', to: 'home#about'
    resources :post, only: :show
    root 'home#index'
  end
end
