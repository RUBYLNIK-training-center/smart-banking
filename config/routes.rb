Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations', 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  get 'home/index'
  root 'home#index'
end
