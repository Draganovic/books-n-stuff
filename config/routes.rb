Rails.application.routes.draw do

  root to: 'static_pages#home'

  resources :books, only: [:index, :show, :new, :create] do
    resources :ratings, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resource :dashboard, only: [:show]
  end


  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
