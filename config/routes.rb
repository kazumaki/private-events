Rails.application.routes.draw do
  root to: 'events#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/invites/:event_id/new', to: 'invites#new'
  post '/invites', to: 'invites#create'

  resources :events, only: [:new, :index, :create, :show]
  resources :users, only: [:show, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
