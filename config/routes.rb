Rails.application.routes.draw do
  get 'follows/create'
  get 'follows/destroy'
  devise_for :users
  resources :users do
    resources :follows, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  resources :comments
  resources :posts
  get "/index", to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  
  # Defines the root path route ("/")
  # root "articles#index"

  get  "comments/destroy"

  get "/myposts", to: "posts#myposts"

    get "/show", to: "users#show"

end