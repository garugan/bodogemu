Rails.application.routes.draw do
  get 'genre/show'
  devise_for :users
  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :games do
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users
  resources :genre
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
