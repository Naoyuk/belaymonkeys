# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :areas
  resources :messages
  resources :chats
  resources :posts
  resources :users, only: [:show]

  get 'static_pages/home'
  get 'static_pages/about'

  get '/partners', to: 'partnerships#index'
  get '/request', to: 'partnerships#create'
  put '/accept_request', to: 'partnerships#accept'
  delete '/remove_partner', to: 'partnerships#destroy'

  # get 'users/show'
  get 'search' => 'searches#search'

  # get 'messages/dms'
  get '/direct_messages', to: 'messages#direct_messages'

  # post 'messages/create_dm'
  post '/create_dm', to: 'messages#create_dm'

  root 'posts#index'
end
