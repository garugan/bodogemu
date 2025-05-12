Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, path: 'admin', controllers: {
  sessions: 'admin/admins/sessions'
}

  root to: "homes#top"
  post 'guest_login', to: 'users#guest_login'

  resources :games do
    resources :reviews
  end

  resources :users
  resources :genres


namespace :admin do
  get 'dashboards', to: 'dashboards#index'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
