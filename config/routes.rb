Rails.application.routes.draw do
  resources :properties
  resources :houses
  resources :house_properties, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "houses#index"

  get "maps", to: "maps#index"
end
