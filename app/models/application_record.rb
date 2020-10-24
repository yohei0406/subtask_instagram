class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def imageposts
    return Imagepost.where(user_id: self.id)
  end

  def alredy_favorited?(imagepost)
    self.favorites.exists?(imagepost_id: imagepost.id)
  end
end
