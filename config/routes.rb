Rails.application.routes.draw do
  resources :posts
  resources :books
  root 'static_pages#home'
  devise_for :users
  resources :users
  # match '/users',   to: 'users#index',   via: 'get', as: :users_index
  # match '/users/changeRole',   to: 'users#changeRole',   via: 'get', :as => :users_changeRole
  # match 'users/create' => 'users#create', via: 'get', as: :admin_create_user
  # match 'users/:id' => 'users#destroy', via: "delete", as: :admin_destroy_user
  # match 'users/:id' => 'users#show', via: 'get', as: :user
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
