Rails.application.routes.draw do
  get '/signup', to: 'admin/users#new'
  post '/signup', to: 'admin/users#create'

  namespace :admin do
    resources :users
  end
end
