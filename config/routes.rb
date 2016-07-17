Rails.application.routes.draw do
  root "welcome#index"

  get '/treasuremaps' => 'treasuremaps#list', as: :treasuremaps
  get '/treasuremaps/new' => 'treasuremaps#new', as: :new_treasuremap
  get '/treasuremaps/:id' => 'treasuremaps#show', as: :treasuremap
  get '/treasuremaps/:id/edit' => 'treasuremaps#edit', as: :edit_treasuremap
  post 'treasuremaps' => 'treasuremaps#create', as: :create_treasuremap
  delete 'treasuremaps/:id' => 'treasuremaps#destroy', as: :delete_treasuremap
  patch 'treasuremaps/:id' => 'treasuremaps#update'

  get 'reset_location' => 'location#reset', as: :reset_map

  post 'current_location' => 'location#locate', as: :current_location

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

end
