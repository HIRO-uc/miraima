Rails.application.routes.draw do
  devise_for :users
  root to: 'tips#index'
  resources :tips, only: [:create, :new, :show, :destroy]
  resources :users, only: [:show] do
    resources :profiles, only: [:new, :create, :edit, :update]
    resources :careers,  only: [:new, :create, :edit, :update]
  end
end
