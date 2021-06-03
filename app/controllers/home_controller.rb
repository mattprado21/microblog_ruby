class HomeController < ApplicationController
  def index
    if params[:search]
      @users = User.search(params[:search])
        .paginate(page: params[:page])

      @posts = Post.search(params[:search])
        .order("created_at DESC")
        .paginate(page: params[:page])
    else
      following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
      @posts = Post.includes(:user)
        .where(
          "user_id IN (#{following_ids}) OR user_id = :user_id",
          user_id: current_user.id,
          deleted: false
        ).order("created_at DESC")
        .paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
