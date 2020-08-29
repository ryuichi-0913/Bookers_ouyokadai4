Rails.application.routes.draw do
  # get 'users/show' 削除
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root :to => 'books#top'

  get "home/about" => "homes#about"

  resources :users, only: [:show, :edit, :update, :index, :destroy]


end
