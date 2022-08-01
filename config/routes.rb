# frozen_string_literal: true

Rails.application.routes.draw do
  get 'partners/destroy'
  get 'users/show'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :areas
  get 'static_pages/home'
  get 'static_pages/about'
  get '/partners', to: 'partners#index'
  get '/request', to: 'partners#create'
  resources :messages
  resources :chats
  resources :posts
  resources :users, only: [:show]
  get 'search' => 'searches#search'

  root 'posts#index'
end
