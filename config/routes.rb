Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  get 'teams/new', to: 'teams#new', as: 'new_team'
  get 'teams/:id', to: 'teams#show', as: 'show_team'
  get 'teams', to: 'teams#index', as: 'teams'
  post 'teams', to: 'teams#create'
  get 'teams/:id/edit', to: 'teams#edit', as: 'edit_team'
  patch 'teams/:id', to: 'teams#update'
  delete 'teams/:id', to: 'teams#destroy', as: 'delete_team'
  get '/search', to: 'teams#search', as: 'search_user'

  get 'projects/new', to: 'projects#new', as: 'new_project'
  get 'projects', to: 'projects#index', as: 'projects'
  post 'projects', to: 'projects#create'
  get 'projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch 'projects/:id', to: 'projects#update'
  delete 'projects/:id', to: 'projects#destroy', as: 'delete_project'
  get '/projects/search', to: 'projects#search', as: 'search_team'
  get 'projects/:id', to: 'projects#show', as: 'show_project'

  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  get 'tasks', to: 'tasks#index', as: 'tasks'
  post 'tasks', to: 'tasks#create'
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy', as: 'delete_task'
  get '/tasks/search', to: 'tasks#search', as: 'search_task'
  get 'tasks/:id', to: 'tasks#show', as: 'show_task'

  get 'persons/profile', as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'persons/profile', as: 'user'
end
