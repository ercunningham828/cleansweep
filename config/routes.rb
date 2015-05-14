Rails.application.routes.draw do
  
  get 'calendar' =>'calendar#index'
  root 'welcome#index'



end
