Rails.application.routes.draw do

  devise_for :users
  get 'home/about' => 'homes#about'
  root to:'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:edit, :create, :update, :index, :show, :destroy]
  resources :users
end
