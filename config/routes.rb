Rails.application.routes.draw do
  get "reactions/create"
  get "reactions/destroy"
  root "home#index"

  # Authentication
  resource :session, only: [:new, :create, :destroy]
  resource :registration, only: [:new, :create]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  # Child Profiles
  resources :child_profiles, except: [:index, :show]

  # Users
  resources :users, only: [:show, :edit, :update]

  # Posts & Feed
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :reactions, only: [:create, :destroy]
  end

  # Category posts
  get ":category/posts", to: "posts#index", as: :category_posts

  # Feed (age-aware)
  get "feed", to: "posts#feed"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
