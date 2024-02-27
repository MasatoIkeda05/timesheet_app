Rails.application.routes.draw do
  get 'new_place' => 'working_places#new'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  post   'check_in'  => 'workingtimes#check_in'
  patch  'check_out' => 'workingtimes#check_out'
  get    'index'     => 'workingtimes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "sessions#new"

  #userごとのURLを利用する
  resources :users
  resources :working_places
end
