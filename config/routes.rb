Rails.application.routes.draw do
devise_for :admins, path: 'admin', controllers: {
  sessions: 'admin/sessions'
}

  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
  end

  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :games do
    resources :reviews
  end
  resources :users
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
