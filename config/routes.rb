Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new', to: 'users#new', as: 'new_user'
  # get '/signup', to: redirect('users/new')  #by doing this we can use /signup to redirect people to 'users/new'
  get '/signup', to: 'users#new'  #dont really need to redirect 
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'session'

  resources :users, only: [:create]  #because we only need create route

  root to: "products#index"

    #this nests the comment route inside products
  resources :products do
    resources :comments, only: [:create]
  end
  # get '/products', to: 'products#index'
  # get '/products/new', to: 'products#new', as: 'new_product'
  # get '/products/:id', to: 'products#show', as: 'product'
  # post '/products', to: 'products#create'
  # get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  # patch '/products/:id', to: 'products#update'
  # delete 'products/:id', to: 'products#destroy'

  
end
