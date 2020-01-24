Rails.application.routes.draw do
  devise_for :users
  root "infos#index"
  resources :infos, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:index]
  end
end