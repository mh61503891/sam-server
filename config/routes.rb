Rails.application.routes.draw do
  resources :applications
  resources :computers
  devise_for :users
  root to: 'users#index'
end
