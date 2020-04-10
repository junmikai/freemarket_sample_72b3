Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create]
  resources :products do
    resources :images, only: [:create]
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
