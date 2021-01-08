Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  resources :tips, only: [:index]
  resources :users, only: [:show] do
    resources :profiles, only: [:new, :create, :edit, :update]
    resources :careers,  only: [:new, :create, :edit, :update]
  end
end
