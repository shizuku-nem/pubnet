Rails.application.routes.draw do
  resources :books
  root 'static_pages#home'
  get '/users', to: "users#index"
  devise_for :users
  match '/users',   to: 'users#index',   via: 'get', as: :users_index
  match '/users/changeRole',   to: 'users#changeRole',   via: 'get', :as => :users_changeRole
  match 'users/:id' => 'users#destroy', via: "delete", as: :admin_destroy_user
  match 'users/:id' => 'users#show', via: 'get', as: :user
  match 'user' => 'users#create', via: 'create', as: :admin_create_user 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
