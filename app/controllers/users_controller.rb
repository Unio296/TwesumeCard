class UsersController < ApplicationController
  #user情報に関わる全ての操作はcurrent_userのみ許可
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :get_current_user, only: [:edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :destroy]
  #before_action :correct_user_update, only: :update


  def edit 
    #before_action get_current_userで取得
  end

  def update
    #before_action get_current_userで取得
    if @user.update_attributes(user_params)
      flash[:success]= "ユーザ設定を変更しました"
      redirect_to root_path
    else
      flash.now[:danger] = "ユーザ設定を変更できませんでした"
      render 'edit'
    end
  end

  def destroy
    #before_action get_current_userで取得
    @user.destroy
    session[:user_id] = nil #sessionも削除
    flash[:success] = "ユーザを削除しました"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :nickname)
    end

    #logged_in_userはapplication_controllerに記述

    def get_current_user
      @user = current_user
    end

end
