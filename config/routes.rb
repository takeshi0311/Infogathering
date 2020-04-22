Rails.application.routes.draw do
  devise_for :users
  root "infos#index"
  resources :infos, only: [:show, :destroy, :create] do
    # resources :comments, only: [:new, :create, :show, :destroy]
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'see', defaults: { format: 'json' }
      get 'delete', defaults: { format: 'json' }
    end
  end
end