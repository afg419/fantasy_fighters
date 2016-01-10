Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :dojo, only: [:new, :create, :show] do
    resources :combatants, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  namespace :combat_federation do
    resources :dojos, only: [:index, :show]
    resource :fight, only: [:new, :create]
  end

  # get '/combat_federation/fight/new/combatants', to: 'combat_federation/fights#new_combatants'

  # get '/combat_federation/fight', to: 'fights#new'



  # resource :combat_federation, only: [:new, :create, :show] do
  #   resources :combatants, only: [:new, :create, :show, :edit, :update, :destroy]
  # end


  # namespace :combat_federation do
  #   resources :combatants, only: [:index, :show]
  # end
end
