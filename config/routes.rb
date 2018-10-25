Rails.application.routes.draw do

  # 静的ページ
  root 'pages#home'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  # contact ページ
  get '/contact', to: 'contact#index'              # 入力画面
  post '/contact/confirm', to: 'contact#confirm'   # 確認画面
  post '/contact/thanks', to: 'contact#thanks'     # 送信完了画面

  # twitter認証
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #App Routes
  resources :users, param: :nickname, only:[:edit, :update, :destroy], shallow: true do
    resources :resumes, param: :slug, only:[:new, :create, :show, :edit, :update, :destroy] do
      member do
      end
    end
    resources :products, param: :slug, only:[:new, :create, :edit, :update, :destroy] do
    end
  end
  
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'

post '/image', to: 'resumes#image', as:'image'

end
