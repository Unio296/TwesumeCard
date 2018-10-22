class Resume < ApplicationRecord
  belongs_to :user                                                              #ユーザに所属する関連付け
  default_scope -> { order(created_at: :desc) }                                 #新しい投稿から表示する順序付け
  attr_accessor :image_hash
  before_create :set_create_slug
  before_save {self.image = "https://s3-ap-northeast-1.amazonaws.com/twesume-storage/images/" + self.user.nickname + "/" + image_hash + ".png"}
  validates :user_id, presence: true                                            #user_idの存在性


  private
    #slug発行
    def set_create_slug
      loop do
        self.slug = SecureRandom.hex(20)
        break unless Resume.where(slug: slug).exists?
      end
    end
end
