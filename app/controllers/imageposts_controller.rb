class ImagepostsController < ApplicationController
  #before_action :logged_in_user, only: [:create]

  def index
  	@imagepost = Imagepost.all
  end

  def new
  	@imagepost = Imagepost.new
  end

  def show
  	@imagepost = Imagepost.find(params[:id])
  	@user = User.find_by(id: @imagepost.user_id)
    @comment = Comment.new
  end

  def create
  	@imagepost = current_user.imageposts.new(imagepost_params)
    if @imagepost.save
      flash[:success] = "投稿に成功しました"
      redirect_to imagepost_path(@imagepost.id)
    else
      flash[:danger] = "投稿に失敗しました"
      render 'new'
    end

  end


  def imagepost_params
      params.require(:imagepost).permit(:image, :user_id)
  end

end
