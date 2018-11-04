class UsersController < ApplicationController
  #ユーザ削除(destroy)は本人のみ
  before_action :correct_user, only: [:edit, :destroy]
  before_action :correct_user_update, only: :update


  def edit 
    @user = User.find_by(nickname: params[:nickname])
  end

  def update
    #correct_user_updateで@user取得
    if @user.update_attributes(user_params)
      flash[:success]= "Profile Updated"
      redirect_to root_path
    else
      flash.now[:danger] = "Update Error..."
      render 'edit'
    end
  end

  def destroy
    #correct_userで@user取得
    @user.destroy
    session[:user_id] = nil #sessionも削除
    flash[:success] = "ユーザを削除しました"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :nickname)
    end

    #current_userが@userと一致するか
    def correct_user
      @user = User.find_by(nickname: params[:nickname])
      #debugger
      unless current_user?(@user) then
        flash[:danger] = "あなたは#{@user.nickname}ではありません"
        redirect_to root_path
      end
    end

    def correct_user_update
      @user = User.find(params[:user][:id])
      unless current_user?(@user) then
        flash[:danger] = "あなたは#{@user.nickname}ではありません"
        redirect_to root_path
      end
    end
end
