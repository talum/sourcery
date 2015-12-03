Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'choice', to: 'sessions#choice', as: 'choice'


  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  get 'users/:id/groups' => 'users#groups', as: 'user_groups'
  resources :users, only: [:show]
  resources :resources
  resources :groups
  resources :comments, only: [:create, :destroy]
 
  root to: "home#show"

end
