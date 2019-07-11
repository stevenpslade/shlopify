Rails.application.routes.draw do
  namespace :admin do
    resources :product_images
  end
  get 'products/index'
  get 'products/show'
  root 'admin/users#new'

  get  '/signup', to: 'admin/users#new'
  post '/signup', to: 'admin/users#create'

  get    '/login',   to: 'admin/sessions#new'
  post   '/login',   to: 'admin/sessions#create'
  get    '/logout',  to: 'admin/sessions#destroy'
  delete '/logout',  to: 'admin/sessions#destroy'

  get '/admin/dashboard', to: 'admin/products#index'

  namespace :admin do
    resources :users
    resources :products
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :products, only: [:index, :show]
end
