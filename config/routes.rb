Rails.application.routes.draw do

  root to: 'static_pages#home'

  resources :books, only: [:index, :show]

end
