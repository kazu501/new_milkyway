Rails.application.routes.draw do
  devise_for :users
  #root_path
  root "homes#top"
  get "help" => "homes#help"
  get "guidline" => "homes#guid"
  get "convention" => "homes#conv"
  get "privacypolicy" => "homes#priv"
  get "contact" => "homes#contact"


  resources :homes, only: [:top, :help, :guid, :conv, :priv, :contact]

  resources :posts do
  	resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show] do
  	member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :news
end
