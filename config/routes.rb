Rails.application.routes.draw do
  authenticated :user do
    root 'users#dashboard', as: :dashboard
  end
  root 'static_pages#home'
  devise_for :users
  resources :animals, only: [:show, :new, :create]
  resources :users, only: [:show]
  resources :transfers, only: [:create]
  resource :search, only: [:show]
end
