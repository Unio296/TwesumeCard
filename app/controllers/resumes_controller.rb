class ResumesController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update, :destroy] #編集、更新、削除は所有者のみ可能

  def new
    @resume = current_user.resumes.build
    @resume.set_image_hash
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save                                                           #resumeを保存
      flash[:success] = "Resume created!"                                     #flashに成功メッセージ
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
    #@resume = Resume.find_by(slug: params[:slug])
  end

  def update
    #@resume = Resume.find_by(slug: params[:slug])
    
    if @resume.update_attributes(resume_params)
      flash[:success] = "カードを更新しました"
      redirect_to resume_path(@resume.slug)
    else
      flash[:danger] = "カードを更新できませんでした"
      render 'edit'
    end
  end

  def destroy
    #@resume = Resume.find_by(slug: params[:slug])
    if @resume.destroy
      degenerate(@resume.image_hash)    #S3から画像を削除
      flash[:success] = "カードを削除しました"
      redirect_to root_path
    else
      flash[:danger] = "カードを削除できませんでした"
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
    @resumes = @q.result.page(params[:page])
    #debugger
  end

  private
    def resume_params
      params.require(:resume).permit(:job_type, :location, :desired_salary, :timing, :age, 
                                    :skills, :capacity, :languages, :employment_pattern, :note, :comment,
                                    :job_type_chk, :location_chk, :desired_salary_chk, :timing_chk, :age_chk, 
                                    :skills_chk, :capacity_chk, :languages_chk, :employment_pattern_chk, :note_chk, 
                                    :image_hash)
    end

    def to_uploaded(base64_param)
      content_type, string_data = base64_param.match(/data:(.*?);(?:.*?),(.*)$/).captures
      tempfile = Tempfile.new
      tempfile.binmode
      tempfile << Base64.decode64(string_data)
      file_param = { type: content_type, tempfile: tempfile }
      ActionDispatch::Http::UploadedFile.new(file_param)
    end

      # S3 Bucket 内に画像を作成
  def generate(image_uri, hash)
    bucket.files.create(key: png_path_generate(hash), public: true, body: open(image_uri))
  end

  # S3 Bucket 内の画像を削除
  def degenerate(hash)
    bucket.files.get(png_path_generate(hash)).destroy
  end

  # pngイメージのPATHを作成する
  def png_path_generate(hash)
    "images/#{current_user.id}/#{hash}.png"
  end

  # bucket名を取得する
  def bucket
    storage.directories.get("twesume-storage")
  end

  # storageを生成する
  def storage
    Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    )
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
