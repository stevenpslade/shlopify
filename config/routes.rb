Rails.application.routes.draw do
  get 'carts/show'
  # for store home page: go to products#index
  get '/' => 'products#index', :constraints => { :subdomain => /.+/ }
  root 'static_pages#home'
  # used to redirect all requests to home for Coming Soon page
  #get '*path' => redirect('/')

  get 'products/index'
  get 'products/show'

  resources :collections, only: [:index, :show] do
    resources :products, only: :show
  end

  resource :cart, only: [] do
    post :add
    post :remove
    post :remove_product
  end

  
  get 'stripe/connect', to: 'stripe#connect', as: :stripe_connect

  get  '/signup', to: 'admin/users#new'
  post '/signup', to: 'admin/users#create'

  get    '/login',   to: 'admin/sessions#new'
  post   '/login',   to: 'admin/sessions#create'
  get    '/logout',  to: 'admin/sessions#destroy'
  delete '/logout',  to: 'admin/sessions#destroy'


  namespace :admin do
    resources :users
    resources :products, except: :show do
      member do
        delete :delete_image_attachment
      end
    end

    resources :collections, except: :show do
      member do
        delete :delete_image_attachment
      end
    end

    resources :orders
    resources :dashboard, only: [:index]
    resources :settings, only: [:index]
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show]

  #get '*path' => redirect('/')
  # catch all but excluding active storage resources
  get '*path', to: 'static_pages#home', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
