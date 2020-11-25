Rails.application.routes.draw do
  #root
  root "sessions#home"

  #signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'

  #logged_in
  get '/user' => 'users#show'

  #logout
  delete '/logout' => 'sessions#destroy'

  #resources :moons, controller: "planet_moons"
  resources :comments
  resources :users do
    resources :planets, only: [:new, :create, :index, :show]
  end

  resources :planets do
    resources :comments
    #resources :moons, only: [:new, :create, :index, :show], controller: "planet_moons"
  end

  get '/auth/google_oauth2/callback', to: 'sessions#google_login'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end