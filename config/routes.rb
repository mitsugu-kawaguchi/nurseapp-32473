Rails.application.routes.draw do
  devise_for :users
  root to: 'techniques#index'
  resources :techniques do
    get :search, on: :collection
  end
  resources :users, only: [:show] do
    resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy,:update,:edit]
end
