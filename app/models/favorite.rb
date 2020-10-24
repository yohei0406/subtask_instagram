class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :imagepost

  validates_uniqueness_of :imagepost_id, scope: :user_id
end
