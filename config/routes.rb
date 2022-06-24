# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  resources :messages
  resources :chats
  devise_for :users
  resources :posts

  root 'posts#index'
end
