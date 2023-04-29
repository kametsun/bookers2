Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  #resources :homes
  devise_for :users
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :update, :edit]
end
