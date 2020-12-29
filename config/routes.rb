Rails.application.routes.draw do
  devise_for :users
  root to: 'techniques#index'
  resources :techniques, only: [:index,:new, :create]
end
