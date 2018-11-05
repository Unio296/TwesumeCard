class SessionsController < ApplicationController
  
  #ユーザログイン時にSession作成
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if user
      session[:user_id] = user.id                                       #cookiesをクライアントに保存
      flash[:success] = "ユーザー認証が完了しました。"
      redirect_back_or root_path
    else
      flash[:danger] = "ユーザ登録エラー"
      redirect_to root_path
    end
    
  end

  #ユーザログアウト時にsession削除
  def destroy
    reset_session
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end