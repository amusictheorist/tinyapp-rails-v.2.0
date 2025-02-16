Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "urls/index"
  get "urls/show"
  get "urls/new"
  get "urls/create"
  get "urls/edit"
  get "urls/update"
  get "urls/destroy"
  get "users/new"
  get "users/create"
  get "users/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "urls#index"
  resources :urls, only: [:index, :new, :create, :show, :edit, :update, :destroy], param: :short_url
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'users#login', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/register', to: 'users#register', as: :register
  post '/register', to: 'users#create'
end
