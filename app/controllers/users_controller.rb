class UsersController < ApplicationController
 before_action :user_params, only: [:update]
 before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else
       render 'edit'
    end
  end

  def likes
    favorites = Favorite.where(user_id: current_user.id).pluck(:imagepost_id)
    @favorite_list = Imagepost.find(favorites)
  end

  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end



  def user_params
    params.require(:user).permit(:fullname, :username, :email, :image, :profile)
  end


end
