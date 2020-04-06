Rails.application.routes.draw do
  devise_for :users
  root "infos#index"
  resources :infos, only: [:show, :destroy, :create] do
    resources :comments, only: [:new, :create, :show, :destroy]
  end
end