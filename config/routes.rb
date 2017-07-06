Rails.application.routes.draw do
  root to: 'blogposts#index', page: 1
  resources :blogposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
