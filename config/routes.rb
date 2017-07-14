Rails.application.routes.draw do
  resources :sessions, only: [ :new, :create ]
  delete '/logout', to: 'sessions#destroy'
  root to: 'blogposts#index', page: 1
  resources :blogposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
