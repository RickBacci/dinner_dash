Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :carts, only: [:create, :show, :index]

  root to: "categories#index"
end
