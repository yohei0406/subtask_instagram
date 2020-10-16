class UsersController < ApplicationController
 before_action :user_params, only: [:update]

  def show
    @user = User.find(params[:id])
    @imagepost = Imagepost.find_by(user_id: @user.id)
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



  def user_params
    params.require(:user).permit(:fullname, :username, :email, :image, :profile)
  end


end
