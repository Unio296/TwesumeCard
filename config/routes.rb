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
  get '/auth/:provider/callback', to: 'sessions#create', as: 'auth_login'
  get '/logout', to: 'sessions#destroy'

  #App Routes
  resources :users, param: :nickname, only:[:new, :show, :destroy]
  
end
