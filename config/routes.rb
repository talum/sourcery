Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'choice', to: 'sessions#choice', as: 'choice'
  post 'favorite', to: 'resources#favorite', as: 'favorite'
  post 'unfavorite', to: 'resources#unfavorite', as: 'unfavorite'
  get 'query', to: "queries#create", as: 'query'
  post 'save', to: "resources#save", as: 'save'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  post 'users/join_group' => 'users#join_group', as: 'join_group'
  get 'users/:id/groups' => 'users#groups', as: 'user_groups'
  delete 'users/leave_group' => 'users#leave_group', as: 'leave_group'
  resources :users, only: [:show, :index]
  resources :resources
  resources :groups
  resources :comments, only: [:create, :destroy]
  resources :google_docs, only: [:create, :destroy]
  resources :favorites, only: [:index]
  resources :teachers, only: [:show]
  resources :videos, only: [:index, :new, :create]
  resources :notifications, only: [:create, :index, :destroy]
  resources :friendships, only: [:create, :destroy]
 
  root to: "home#show"

end
