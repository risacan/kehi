Rails.application.routes.draw do
  devise_for :users
  get 'companies/new'

  root 'pages#index'

  get 'pages/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
