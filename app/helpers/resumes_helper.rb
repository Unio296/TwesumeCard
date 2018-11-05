module ResumesHelper

  #resumeのTWITTERカード画像のURLを返す
  def resume_image_url(resume)
    "https://s3-ap-northeast-1.amazonaws.com/twesume-storage/images/#{resume.user.id}/resumes/#{resume.image_hash}.png"
  end

end
