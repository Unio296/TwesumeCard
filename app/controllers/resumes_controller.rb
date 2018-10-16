class ResumesController < ApplicationController
  def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save                                                          #resumeを保存
      flash[:success] = "Resume created!"                                    #flashに成功メッセージ
      redirect_to root_url                                                      #rootにリダイレクト
    else                                                                        #保存できなかった場合
      #@resume = current_user.resumes.build
      render 'pages/home'                                                #homeアクションでrender
    end
  end

  #ツイート用画像をPOST
  def image
    generate(to_uploaded(params[:imgData]), params[:hash])
    data = []
    render :json => data
  end

  private
    def resume_params
      params.require(:resume).permit(:job_type, :location, :desired_salary, :timing, :age, 
                                    :skills, :capacity, :languages, :employment_pattern, :note)
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

  # pngイメージのPATHを作成する
  def png_path_generate(hash)
    "images/#{hash}.png"
  end

  # bucket名を取得する
  def bucket
    # production / development / test
    environment = Rails.env
    storage.directories.get("bigtweet2-#{environment}")
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
end
