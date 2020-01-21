Rails.application.routes.draw do

  get 'events', to: 'events#index'
  get 'events/new', to: 'events#new'
  post 'events',    to: 'events#create'
  get 'events/:id', to: 'events#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
