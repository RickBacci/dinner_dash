Rails.application.routes.draw do

  resources :carts, only: [:create]
  # move this to line_items#create

  get "/cart", to: "carts#show"
  delete "/cart", to: "carts#destroy"
  put "/cart", to: "carts#update"

  resources :users, only: [:new, :create]

  resources :users, only: [:show] do
    resources :orders, except: [:edit, :delete, :new, :update, :destroy]
  end

  resources :items, only: [:index, :show]

  resources :categories, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :items, only: ['/items/retire'] do
      member do
        patch '/items/retire', to: 'items#retire'
      end
    end
    get '/dashboard', to: 'dashboard#index'

    resources :items, except: [:destroy]
    resources :orders, except: [:create, :new, :update, :destroy]
   resources :categories do
     resources :items, except: [:destroy]
   end
  end
  root to: "categories#index"
end
