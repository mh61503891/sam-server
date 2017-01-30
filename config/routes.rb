Rails.application.routes.draw do
  resources :licenses
  resources :applications
  resources :computers
  root to: 'root#index'
  devise_for :people
  devise_scope :person do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  namespace :people do
    resources :search, only:[:index]
  end
  resources :people, only:[:index, :show]

end
