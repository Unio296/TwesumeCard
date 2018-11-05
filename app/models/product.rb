class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  before_create :set_create_slug
  validates :user_id, presence: true
  validates :title, presence: true
  validate  :image_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end

    #slug発行
    def set_create_slug
      loop do
        self.slug = SecureRandom.hex(7)
        break unless Product.where(slug: slug).exists?
      end
    end
end
