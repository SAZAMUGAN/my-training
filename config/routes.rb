Rails.application.routes.draw do
  devise_for :users
  root to: 'training_menus#index'
  resources :training_menus do
    resources :menu_records 
    collection do
      get 'search'
    end
  end
end
