Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :properties
  resources :schedule
  resources :bookings do 
    member do
      get 'confirm'
      get 'reject'
      get 'cancel'
      get 'complete'
    end
  end

  resources :booking_steps 
  

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root 'welcome#index'

end
