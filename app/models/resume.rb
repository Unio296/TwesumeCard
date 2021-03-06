class Resume < ApplicationRecord
  mount_base64_uploader :image, CardUploader
  belongs_to :user                                                              #ユーザに所属する関連付け
  default_scope -> { order(created_at: :desc) }                                 #新しい投稿から表示する順序付け
  
  before_save {self.increment(:update_count,1)}
  before_create :set_create_slug      #作成時のみ発行
  before_create :set_bitly_url        #短縮URL発行
  before_update :set_bitly_url        #短縮URL更新
  
  validates :user_id, presence: true                                            #user_idの存在性

  private
    #slug発行
    def set_create_slug
      loop do
        self.slug = SecureRandom.hex(7)
        break unless Resume.where(slug: slug).exists?
      end
    end

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 1.megabytes
        errors.add(:image, "should be less than 1MB")
      end
    end

    # bitlyのurl生成
    def set_bitly_url
      case Rails.env
      when "development"
        host = "http://127.0.0.1:3000"
      when "production"
        host = "https://twesumes.net"
      end

      self.bitly_url = Bitly.client.shorten("#{host}/resumes/#{self.slug}?u=#{self.update_count}").short_url
    end

end
