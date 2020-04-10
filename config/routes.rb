Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :products do
    resources :images, only: [:create,]
  end
  resources :destinations, only: [:new, :show]
  resources :users, only: [:show]

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ユーザーおよびカードの登録
      get 'done' # 登録完了後のページ
    end
  end
end
