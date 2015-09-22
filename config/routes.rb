Rails.application.routes.draw do
  resources :animals, only: [:show, :new, :create]
end
