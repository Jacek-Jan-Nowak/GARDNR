Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "profile", to: 'pages#profile'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gardens do
    resources :bookings
    resources :reviews, only: [:new, :edit, :create, :update] 
  end
    resources :reviews, only: [:destroy]
end
