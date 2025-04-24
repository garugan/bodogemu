Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
