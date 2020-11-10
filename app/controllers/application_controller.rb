class ApplicationController < ActionController::Base

   def after_sign_in_path_for(resource)
     user_path(resource.id)
   end

   def after_sign_up_path_for(resource)
     user_path(resource.id)
   end

   def after_inactive_sign_up_path_for(resource)
     user_path(id: current_user.id)
   end

   def logged_in_user
     unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
     end
   end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
