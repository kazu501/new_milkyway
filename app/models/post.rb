class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 255 }
end
