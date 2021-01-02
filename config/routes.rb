Rails.application.routes.draw do
  devise_for :users
  root to: 'techniques#index'
  resources :techniques
  resources :users, only: :show
end
