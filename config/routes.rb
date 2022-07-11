Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/home'
  get 'pages/welcome'

  resources :feeds
  devise_for :users

  resources :users, only: [:show], shallow: true do
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#welcome"
end
