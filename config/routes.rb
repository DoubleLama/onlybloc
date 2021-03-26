Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :cities
    resources :climbing_centers
    resources :ratings
    resources :comments

    root to: 'users#index'
  end

  root 'cities#index'

  get '/about_us', to: 'static_pages#about_us'
  get '/contact', to: 'static_pages#contact'

  devise_for :users, path: ''

  resources :users, path: 'mon_compte'
  resources :cities
  resources :climbing_centers do
    resources :ratings
    resources :comments
  end
end
