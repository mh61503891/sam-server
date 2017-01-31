Rails.application.routes.draw do
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
  namespace :computers do
    resources :search, only:[:index]
  end
  resources :computers, only:[:index, :show]
  namespace :applications do
    resources :search, only:[:index]
  end
  resources :applications, only:[:index, :show]
  namespace :licenses do
    resources :search, only:[:index]
  end
  resources :licenses, only:[:index, :show]
  # devise_for :people, skip:['sessions#new']
end
