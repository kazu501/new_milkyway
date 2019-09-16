Rails.application.routes.draw do
  #root_path
  root 'posts#index'

  resources :posts
end
