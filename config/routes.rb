Rails.application.routes.draw do

  root 'users#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:welcome, :new, :create, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
