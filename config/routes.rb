Rails.application.routes.draw do
  root 'books#index'
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
