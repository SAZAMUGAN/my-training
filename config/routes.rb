Rails.application.routes.draw do
  root to: 'training_menus#index'
  resources :training_menus, only: :index
end
