Rails.application.routes.draw do
  locale = /ru|en/
  resources :adverts
  resources :users

  get 'login' => "sessions#new", as: :login, constraints: { subdomain: locale }

  post 'login' => "sessions#create"

  patch 'logout' => "sessions#destroy", as: :logout

  constraints subdomain: locale do
    root 'root#index'
  end
  # root 'root#index', constraints: { subdomain: locale }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
