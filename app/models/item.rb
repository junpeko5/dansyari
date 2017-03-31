class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validate  :image_size

  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  private

    # アップロード画像のサイズを検証する
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
