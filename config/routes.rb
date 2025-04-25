Rails.application.routes.draw do
  get 'games/new'
  get 'games/index'
  get 'games/show'
  get 'games/game_review'
  devise_for :users
  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
