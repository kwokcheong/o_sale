Rails.application.routes.draw do
  get 'users/new', to: 'users#new', as: 'new_user'
  get '/signup', to: redirect('users/new')  #by doing this we can use /signup to redirect people to 'users/new'
  resources :users, only: [:create]  #because we only need create route

  root to: "products#index"

  resources :products
  # get '/products', to: 'products#index'
  # get '/products/new', to: 'products#new', as: 'new_product'
  # get '/products/:id', to: 'products#show', as: 'product'
  # post '/products', to: 'products#create'
  # get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  # patch '/products/:id', to: 'products#update'
  # delete 'products/:id', to: 'products#destroy'

  
end
