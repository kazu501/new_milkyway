Rails.application.routes.draw do
  devise_for :users
  #root_path
  root 'posts#index'

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
