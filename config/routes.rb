Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :properties
  resources :schedule
  

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root 'welcome#index'

end
