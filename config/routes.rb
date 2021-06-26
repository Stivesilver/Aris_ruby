Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  get 'teams/new', to: 'teams#new', as: 'new_team'
  get 'teams/:id', to: 'teams#show', as: 'show_team'
  get 'teams', to: 'teams#index', as: 'teams'
  post 'teams', to: 'teams#create'
  get 'teams/:id/edit', to: 'teams#edit', as: 'edit_team'
  patch 'teams/:id', to: 'teams#update', as: 'update'
  delete 'teams/:id', to: 'teams#destroy', as: 'delete_team'
  get '/search', to: 'teams#search', as: 'search_user'

  get 'persons/profile', as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'persons/profile', as: 'user'
end
