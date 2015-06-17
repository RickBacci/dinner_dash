Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :categories, only: [:index] do
    resources :items, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: 'categories#index'
end
