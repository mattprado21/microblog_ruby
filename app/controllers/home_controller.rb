class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user)
      .where(deleted: false)
      .where(user_id: current_user.id)
      .order("created_at DESC")
    # abort @posts
  end
end
