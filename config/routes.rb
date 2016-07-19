Rails.application.routes.draw do

  use_doorkeeper

  root "welcome#index"

  get '/treasuremaps' => 'treasuremaps#list', as: :treasuremaps
  get '/treasuremaps/new' => 'treasuremaps#new', as: :new_treasuremap
  get '/treasuremaps/:id' => 'treasuremaps#show', as: :treasuremap
  get '/treasuremaps/:id/edit' => 'treasuremaps#edit', as: :edit_treasuremap
  post 'treasuremaps' => 'treasuremaps#create', as: :create_treasuremap
  delete 'treasuremaps/:id' => 'treasuremaps#destroy', as: :delete_treasuremap
  patch 'treasuremaps/:id' => 'treasuremaps#update'

  get 'treasuremaps/:id/photos/new' => 'photos#new', as: :new_photo
  post 'treasuremaps/:id/photos/' => 'photos#create', as: :create_photo
  get 'treasuremaps/:id/photos/:photo_id' => 'photos#show', as: :photo

  get 'reset_location' => 'location#reset', as: :reset_map

  post 'current_location' => 'location#locate', as: :current_location

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

  get 'api/photos' => 'api/photos#list'
end
