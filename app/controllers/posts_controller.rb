class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      content: params[:content],
      deleted: false,
    )

    if @post.save
      redirect_to root_path
    end
  end
  
  def view
    @posts = Post.includes(:user).find(params[:id])
  end
end
