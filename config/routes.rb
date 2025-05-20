Rails.application.routes.draw do
devise_for :admins, path: 'admin', controllers: {
  sessions: 'admin/admins/sessions'
}

  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
    resources :dashboards, only: [:show, :destroy]
    resources :games
    resources :genres
    resources :reviews
  end

  root to: "homes#top"
  get "/search", to: "searches#search"
  post 'guest_login', to: 'users#guest_login'

  resources :games do
    resources :reviews
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
