class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :imagepost
  validates :comment_content, presence: true
end
