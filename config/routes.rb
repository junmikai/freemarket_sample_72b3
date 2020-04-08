Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create]

  resources :products do
    resources :images, only: [:create, ]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get<div class="code-title" data-title="Gemfile">_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :destinations, only: [:new, :show]
  resources :users, only: [:show]
end
