Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'

  resources :users, only: [:welcome, :new, :create, :show]

  resources :exercises, only: [:index, :new, :create, :show, :destroy] do
    resources :activities
  end

  resources :activities, only: [:index]
end
