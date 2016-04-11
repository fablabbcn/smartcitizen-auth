Rails.application.routes.draw do

  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  root to: 'sessions#new'
end
