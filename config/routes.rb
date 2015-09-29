Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :animals, only: [:show, :new, :create]
  resources :users, only: [:show]
  resource :search, only: [:show]
end
