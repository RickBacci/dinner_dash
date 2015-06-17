Rails.application.routes.draw do

  resources :carts, only: [:create, :show, :index]
  resources :users, only: [:new, :create, :show]

  resources :items, only: [:show, :index]

  resources :categories, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: "categories#index"
end
