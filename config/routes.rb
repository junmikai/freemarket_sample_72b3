Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create]
  resources :products do
    resources :images, only: [:create]
  end
  resources :destinations, only: [:new, :show]
  resources :users, only: [:show]
end
