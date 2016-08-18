Rails.application.routes.draw do
  resources :users

  get 'login' => "sessions#new", as: :login

  post 'login' => "sessions#create"

  patch 'logout' => "sessions#destroy", as: :logout

  root 'root#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
