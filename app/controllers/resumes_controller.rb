class ResumesController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update, :destroy] #編集、更新、削除は所有者のみ可能

  def new
    @resume = current_user.resumes.build
    #@resume.set_image_hash
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save                                                           #resumeを保存
      flash[:success] = "TWESUMEを作成しました"                                 #flashに成功メッセージ
      redirect_to root_url                                                    #rootにリダイレクト
    else                                                                      #保存できなかった場合
      render 'new'                                                            #homeアクションでrender
    end
  end

  def show
    @resume = Resume.find_by(slug: params[:slug])
    @products = @resume.user.products.all
  end

  def edit
    # @resumeはcorrect_userで取得済
  end

  def update
    # @resumeはcorrect_userで取得済
    if @resume.update_attributes(resume_params)
      flash[:success] = "TWESUMEを更新しました"
      redirect_to resume_path(@resume.slug)
    else
      flash[:danger] = "TWESUMEを更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    # @resumeはcorrect_userで取得済
    if @resume.destroy
      flash[:success] = "TWESUMEを削除しました"
      redirect_to root_path
    else
      flash[:danger] = "TWESUMEを削除できませんでした"
      redirect_to resume_path(@resume.slug)
    end
  end

  #ツイート用画像をPOST
  def image
    generate(to_uploaded(params[:imgData]), params[:hash])
    data = []
    render :json => data
  end

  # 検索
  def index
    @q = Resume.ransack(params[:q])
    @resumes = @q.result.page(params[:page]).per(10)
    #debugger
  end

  private
    def resume_params
      params.require(:resume).permit(:job_type, :location, :desired_salary, :timing, :age, 
                                    :skills, :capacity, :languages, :employment_pattern, :note, :comment,
                                    :job_type_chk, :location_chk, :desired_salary_chk, :timing_chk, :age_chk, 
                                    :skills_chk, :capacity_chk, :languages_chk, :employment_pattern_chk, :note_chk, 
                                    :image)
    end

  #current_userが@userと一致するか
  def correct_user
    @resume = Resume.find_by(slug: params[:slug])
    #debugger
    unless current_user?(@resume.user) then
      flash[:danger] = "あなたは#{@user.nickname}ではありません"
      redirect_to root_path
    end
  end

end
