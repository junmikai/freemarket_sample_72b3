Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :products do
    resources :images, only: [:create, ]
  end
  resources :destinations, only: [:new, :show]
  resources :users, only: [:show]
end
