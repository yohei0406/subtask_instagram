class Imagepost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :user_id, presence: true
end
