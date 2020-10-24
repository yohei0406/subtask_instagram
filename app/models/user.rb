class User < ApplicationRecord
  has_many :imageposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites, dependent: :destroy
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

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Imagepost.where("user_id IN (#{following_ids})", user_id: id)
  end


end
