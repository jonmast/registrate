Rails.application.routes.draw do
  authenticated :user do
    root 'users#dashboard', as: :dashboard
  end
  root 'static_pages#home'
  get 'map', to: 'static_pages#map'
  devise_for :users
  resources :animals, only: [:show, :new, :create]
  resources :users, only: [:show] do
    get 'locations', on: :collection
  end
  resources :transfers, only: [:create]
  resources :listings, only: [:create, :show, :index]
  resource :search, only: [:show]
end
