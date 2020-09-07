Rails.application.routes.draw do
  # get 'users/show' 削除
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root :to => 'books#top'

  get "home/about" => "homes#about"
  get "user/follow" => "users#follow"
  get "user/followed" => "users#followed"

  resources :users, only: [:show, :edit, :update, :index, :destroy]
  resources :books, only: [:new, :create, :index, :show] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]



	end
  post 'users/follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'users/unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


end
