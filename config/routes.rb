Rails.application.routes.draw do
  devise_for :users
  root to: 'techniques#index'
  resources :techniques do
    get :search, on: :collection
  end
  resources :meetings, only: [:new,:create]
  resources :users, only: [:show]
  resources :posts, only: [:show,:create] do
    resources :comments, only: [:create,:destroy,:update,:edit]
  end
end
