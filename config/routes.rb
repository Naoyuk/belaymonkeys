# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :areas
  get 'static_pages/home'
  get 'static_pages/about'
  resources :messages
  resources :chats
  resources :posts

  root 'posts#index'
end
