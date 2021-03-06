Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  telegram_webhook TelegramWebhookController

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks, controllers: { 
      registrations: 'users/registrations'
    }
    
    resources :wallets
    resource :users
    resources :transactions
    resources :categories
    
    resources :services
    
    resources :services do
      resources :transactions, shallow: true
    end
    
    get '/about', to: 'home#about'
    get '/support', to: 'home#support'
    resources :post, only: :show
    root 'home#index'
  end
end
