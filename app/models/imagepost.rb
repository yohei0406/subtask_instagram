class Imagepost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :user_id, presence: true

  def comments
    return Comment.where(imagepost_id: self.id)
  end
end
