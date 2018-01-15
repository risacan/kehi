Rails.application.routes.draw do
  devise_for :users
  resources :companies, only: [:new, :create]
  resources :expenses, only: [:new, :create, :show, :index]
  resources :expenses do
    member do
      patch :approve
      patch :reject
    end
  end
  root 'pages#index'
  get 'pages/show'
  namespace :api do
    resources :expenses, only: :show
  end
end
