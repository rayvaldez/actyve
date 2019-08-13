Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
  get '/exercise_type/:id' => 'exercises#show', as: 'exercise_type'

  resources :users, only: [:welcome, :new, :create, :show]

  resources :exercises, only: [:index, :show] do
    resources :activities
  end

  resources :activities, only: [:index]
end
