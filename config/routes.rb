Rails.application.routes.draw do

  #resources :homes
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users
  
  #booksにいいねとコメントを結びつける
  resources :books, only: [:show, :create, :edit, :update, :index, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :update, :edit]

end
