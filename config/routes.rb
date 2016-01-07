Rails.application.routes.draw do
  root 'welcome#index'

  resource :dojo, only: [:new, :create, :show] do
    resources :combatants, only: [:new]
  end


end
