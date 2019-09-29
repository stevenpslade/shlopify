Rails.application.routes.draw do
  root 'static_pages#home'
  # used to redirect all requests to home for Coming Soon page
  #get '*path' => redirect('/')

  get 'products/index'
  get 'products/show'

  get  '/signup', to: 'admin/users#new'
  post '/signup', to: 'admin/users#create'

  get    '/login',   to: 'admin/sessions#new'
  post   '/login',   to: 'admin/sessions#create'
  get    '/logout',  to: 'admin/sessions#destroy'
  delete '/logout',  to: 'admin/sessions#destroy'

  namespace :admin do
    resources :users
    resources :products
    resources :product_images
    resources :orders
    resources :dashboard, only: [:index]
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :products, only: [:index, :show]
  resources :orders

  get '*path' => redirect('/')
end
