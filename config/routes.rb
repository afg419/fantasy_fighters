Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :dojo, only: [:new, :create, :show] do
    resources :combatants, only: [:new]
  end

  namespace :combat_federation do
    resources :dojos, only: [:index, :show]
  end
end
