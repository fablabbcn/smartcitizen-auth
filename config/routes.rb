Rails.application.routes.draw do

  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'password_reset/:token', to: 'sessions#password_reset_landing', as: 'password_reset'
  post 'change_password', to: 'sessions#change_password', as: 'change_password'

  resources :users
  resources :sessions
  root to: 'sessions#new'
end
