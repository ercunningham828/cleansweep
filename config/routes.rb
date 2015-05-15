Rails.application.routes.draw do
  get 'registrations/create'

  devise_for :users
  resources :users
  

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root 'welcome#index'

end
