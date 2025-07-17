Rails.application.routes.draw do
devise_for :admins, path: 'admin', controllers: {
  sessions: 'admin/admins/sessions'
}  

    devise_for :users
    root to: "homes#top"
    resources :games do
      resources :reviews do
        resources :review_comments
      end
    end
    resources :users
    resources :reviews
    resources :genres
    get "/search", to: "searches#search"
    post 'guest_login', to: 'sessions#guest_login'

  namespace :admin do
    root to: 'dashboards#index'
    resources :dashboards, only: [:show, :destroy]
    resources :games
    resources :genres
    resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end