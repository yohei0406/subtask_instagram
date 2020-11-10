class HomeController < ApplicationController
before_action :authenticate_user!
  def index
  	  @imagepost  = current_user.imageposts.build
      @feed_items = current_user.feed
      @comment = Comment.new
  end
end
