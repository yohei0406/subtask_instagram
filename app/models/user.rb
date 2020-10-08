class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :fullname, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true, length: { maximum: 255 }
  validates :username, uniqueness: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 200 }


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.name
      user.fullname = auth.fullname
      user.email = auth.info.email
      user.profile = auth.profile
      user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
      user.image = auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
    end
  end
end
