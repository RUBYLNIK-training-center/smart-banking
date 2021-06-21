Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations', 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  resources :users
  
  get 'home/index'
  get '/about', to: 'home#about'
  root 'home#index'
end
