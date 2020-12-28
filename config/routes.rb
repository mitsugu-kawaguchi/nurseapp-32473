Rails.application.routes.draw do
  devise_for :users
  root to: 'techniques#index'
end
