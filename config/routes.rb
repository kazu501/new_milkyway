Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  #root_path
  root 'posts#index'

  resources :posts
  resources :users, only: [:index, :show]
end
