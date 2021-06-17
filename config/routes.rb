Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/posts'
  resources :reservations
  
  get 'rooms/index'
  get 'rooms/posts'
  resources :rooms
  
  get 'users/show'
  get 'home/top'
  
  devise_for :users
  devise_for :rooms
  
  resources :users, :only => [:show]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
