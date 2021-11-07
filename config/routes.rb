Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
 get 'homes/about'
 resources :users, only: [:show, :edit, :update, :index, :destroy]
end