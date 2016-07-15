Rails.application.routes.draw do
  root "welcome#index"

  get 'reset_location' => 'location#reset', as: :reset_map

  post 'current_location' => 'location#locate', as: :current_location

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

end
