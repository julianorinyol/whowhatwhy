Rails.application.routes.draw do
  resources :hangouts
  resources :groups
  get '/profile', to: 'users#show'
  # root to: 'visitors#index'
  root to: 'users#show'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
