Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'choice', to: 'sessions#choice', as: 'choice'
  get 'query', to: "queries#create", as: 'query'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  get 'users/:id/groups' => 'users#groups', as: 'user_groups'
  resources :users, only: [:show, :index]
  resources :resources
  resources :groups
  resources :comments, only: [:create, :destroy]
  resources :google_docs, only: [:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :teachers, only: [:show]
  resources :videos
  resources :notifications, only: [:create, :index, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :user_groups, only: [:create, :destroy]
 
  root to: "home#show"

end
