Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:welcome, :new, :create, :show]

  resources :exercises, only: [:index, :new, :create, :show] do
    resources :activities, only: [:new, :create, :show]
  end

  resources :activities, only: [:index]
end
