Rails.application.routes.draw do
  devise_for :users
  resources :companies, only: [:new, :create]
  root 'pages#index'
  get 'pages/show'
end
