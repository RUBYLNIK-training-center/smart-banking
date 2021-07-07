Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks, controllers: { 
      registrations: 'users/registrations'
    }
    
    resources :wallets
    resource :users
    resource :transactions
    
    get 'home/index'
    get '/about', to: 'home#about'
    resources :post, only: :show
    root 'home#index'
  end
end
