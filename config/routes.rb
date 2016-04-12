Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index" 
  resources :posts
  resources :comments, except: [:index, :show]
  resources :users, only: [:show, :edit, :update]
end
