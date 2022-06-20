Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/home'
  get 'pages/welcome'

  resources :posts
  resources :feeds
  devise_for :users

  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#welcome"
end
