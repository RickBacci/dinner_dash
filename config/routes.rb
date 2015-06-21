Rails.application.routes.draw do

  resources :carts, only: [:create]
  # move this to line_items#create

  get "/cart", to: "carts#show"
  post "/cart", to: "carts#destroy"

  resources :users, only: [:new, :create]

  resources :users, only: [:show] do
    resources :orders
  end

  resources :items, only: [:show, :index, :new, :create]

  resources :categories, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end
  root to: "categories#index"
end
