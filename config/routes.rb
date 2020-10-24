Rails.application.routes.draw do
  resources :properties
  resources :houses do
    member do
      put "toggle_favorite", to: "houses#toggle_favorite"
      put "toggle_hidden", to: "houses:toggle_hidden"
    end
  end
  resources :house_properties, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "houses#index"

  get "maps", to: "maps#index"
end
