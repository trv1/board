Rails.application.routes.draw do
  locale = /ru|en/

  # mount RuCaptcha::Engine => '/rucaptcha'

  root 'root#root', constraints: { subdomain: '' }

  # get 'login' => "sessions#new", as: :login, constraints: { subdomain: locale }
  # post 'login' => "sessions#create", constraints: { subdomain: locale }
  # patch 'logout' => "sessions#destroy", as: :logout, constraints: { subdomain: locale }

  constraints subdomain: locale do
    get '/' => 'root#index', as: :root_index
    resources :users
    devise_for :users,
               path: 'auth',
               path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' },
               controllers: {registrations: 'registrations', sessions: 'sessions', confirmations: 'users/confirmations' }
    resources :adverts
    get 'bicycle/new' => 'adverts#classic', as: :bicycle_new
    get 'velomobile/new' => 'adverts#velomobile', as: :velomobile_new
    post 'upload_picture' => 'adverts#upload_picture', as: :advert_upload_picture
    post 'remove_picture' => 'adverts#remove_picture', as: :advert_remove_picture
    get 'load_cities' => 'adverts#load_cities', as: :load_cities
  end

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
