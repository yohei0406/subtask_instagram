class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(imagepost_id: params[:imagepost_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	@imagepost = Imagepost.find(params[:imagepost_id])
  	@favorite = current_user.favorites.find_by(imagepost_id: @imagepost.id)
  	@favorite.destroy
  	redirect_back(fallback_location: root_path)
  end
end
