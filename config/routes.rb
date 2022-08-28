Rails.application.routes.draw do
  devise_for :users
  root to: 'training_menus#index'
  resources :training_menus, only: :index
end
