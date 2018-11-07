class Resume < ApplicationRecord
  mount_base64_uploader :image, CardUploader
  belongs_to :user                                                              #ユーザに所属する関連付け
  default_scope -> { order(created_at: :desc) }                                 #新しい投稿から表示する順序付け
  
  before_create :set_create_slug
  before_save {self.increment(:update_count,1)}
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

end
