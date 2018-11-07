Rails.application.routes.draw do

  # 静的ページ
  root 'pages#home'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  # contact ページ
  get '/contact', to: 'pages#contact'              # Twitter公式アカウントへのリンク
  
  # contact こちらも完成してるが運用のしやすさからTwitter公式アカウントにしてもらうことにした
  #get '/contact', to: 'contact#index'              # 入力画面
  #post '/contact/confirm', to: 'contact#confirm'   # 確認画面
  #post '/contact/thanks', to: 'contact#thanks'     # 送信完了画面
  

  # twitter認証
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #App Routes
  get '/resumes/index', to: 'resumes#index'
  resources :users, param: :nickname, only:[:edit, :update, :destroy], shallow: true do
    resources :resumes, param: :slug, only:[:new, :create, :show, :edit, :update, :destroy] do
    end
    resources :products, param: :slug, only:[:new, :create, :edit, :update, :destroy] do
    end
  end

  
  # carrierwave経由で投稿するようにしたので不要になった
  #post '/image', to: 'resumes#image', as:'image'

end
