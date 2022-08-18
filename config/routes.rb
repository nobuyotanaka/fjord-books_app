Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do # idを付ける
      get :followings, :followers
    end
    resources :follow_relationships, only: %i[create destroy]
  end
end
