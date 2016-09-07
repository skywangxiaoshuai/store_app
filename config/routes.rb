Rails.application.routes.draw do
  resources :line_items
  resources :carts do
    collection do
      delete :delete_line_item
    end
  end
  resources :products do
    collection do
      get :man_products
      get :man_clothing
      get :man_shirt
      get :man_pants
      get :man_shoes
      get :man_hiking
      get :man_casual
      get :women_products
      get :women_clothing
      get :women_shirt
      get :women_pants
      get :women_shoes
      get :women_hiking
      get :women_casual
    end
  end
  resources :users
  root 'products#all_products'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
