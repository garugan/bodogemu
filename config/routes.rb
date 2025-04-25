Rails.application.routes.draw do
  get 'genre/show'
  devise_for :users
  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :games
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
