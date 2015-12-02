Rails.application.routes.draw do
  resources :resources, except: [:index] 
  resources :groups
end
