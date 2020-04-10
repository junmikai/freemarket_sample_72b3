Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create] do
    collection do
      get 'buy'
    end
  end
  resources :products do
    resources :images, only: [:create]
  end
  resources :destinations, only: [:new, :create, :show]
  resources :users, only: [:show]
end
