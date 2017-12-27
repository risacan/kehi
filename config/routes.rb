Rails.application.routes.draw do
  devise_for :users
  resources :companies, only: [:new, :create]
  resources :expenses, only: [:new, :create, :show]
  root 'pages#index'
  get 'pages/show'
end
