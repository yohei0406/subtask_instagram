class CommentsController < ApplicationController

  def create
  	@comment = current_user.comments.new(comment_params)
	  if @comment.save
	    flash[:success] = "コメントしました"
	    redirect_back(fallback_location: root_path)
	  else
	    flash[:danger] = "コメントできません"
	    redirect_back(fallback_location: root_path)
	  end
  end


  def comment_params
    params.require(:comment).permit(:comment_content, :imagepost_id)
  end

end
