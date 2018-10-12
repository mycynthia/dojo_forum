Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
  end
    root "posts#index"
  namespace :admin do
    resources :categories
    resources :users, only: [:index, :update]
    root "categoriess#index"
  end
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update] do
    member do
      get :mycomments
      get :mydrafts
    end
  end
end
