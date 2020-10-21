# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :username, :email, :image])
   end



end
