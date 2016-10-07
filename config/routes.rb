Rails.application.routes.draw do
  locale = /ru|en/

  root 'root#root'

  get 'login' => "sessions#new", as: :login, constraints: { subdomain: locale }

  post 'login' => "sessions#create", constraints: { subdomain: locale }

  patch 'logout' => "sessions#destroy", as: :logout, constraints: { subdomain: locale }

  constraints subdomain: locale do
    get '/' => 'root#index', as: :root_index
    resources :users
    resources :adverts
  end

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
