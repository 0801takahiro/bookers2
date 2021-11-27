Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 resources :books
 get 'home/about' => 'homes#about'
 resources :users, only: [:show, :edit, :update, :index, :destroy]
end