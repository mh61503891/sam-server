Rails.application.routes.draw do
  resources :licenses
  resources :applications
  resources :computers
  resources :users
  devise_for :users
  root to: 'users#index'
end
