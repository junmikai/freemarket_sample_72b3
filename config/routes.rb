Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new]
  resources :destinations, only: [:new, :show]
  resources :users, only: [:index]
end
